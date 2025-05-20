const fs = require('fs');
const path = require('path');
const solc = require('solc');

const versionMap = JSON.parse(fs.readFileSync('compilerVersions.json', 'utf-8'));

let results = {}
const resultsPath = './compiled/results_constructor.json';
if (fs.existsSync(resultsPath)) {
    results = JSON.parse(fs.readFileSync(resultsPath, 'utf-8'));
}


function findAllContracts(dir) {
    const contracts = [];

    for (const entry of fs.readdirSync(dir)) {
        const fullPath = path.join(dir, entry);
        const stat = fs.statSync(fullPath);
        if (stat.isDirectory()) {
            contracts.push(...findAllContracts(fullPath));
        } else if (entry.endsWith('.sol')) {
            contracts.push(fullPath);
        }
    }
    return contracts;
}


(async () => {
    for (const [shortVersion, longVersion] of Object.entries(versionMap)) {
        const folderPath = path.join('rendered/constructor', `${shortVersion}`);
        if (!fs.existsSync(folderPath)) continue;
        
        const solcContracts = findAllContracts(folderPath);

        const solcSnapshot = await new Promise ((resolve, reject) => 
            solc.loadRemoteVersion(longVersion, (err, solcSpecific) =>
                err ? reject(err): resolve(solcSpecific)
            )
        );

        for (const filePath of solcContracts) {
            const contractCode = fs.readFileSync(filePath, 'utf-8');
            const contractName = path.basename(filePath, '.sol');

            const compileInput = {
                language: 'Solidity',
                sources: {[path.basename(filePath)]: { content: contractCode }},
                settings: {
                    outputSelection: {
                        '*': {
                            '*': ['abi', 'evm.bytecode']
                        }
                    },
                    optimizer: {
                        enabled: false,
                        runs: 200
                    }
                }
            };
            const compilerOutput = JSON.parse(solcSnapshot.compile(JSON.stringify(compileInput)));

            const outDir = path.join('compiled/constructor', shortVersion);
            fs.mkdirSync(outDir, {recursive: true});
            const outFile = path.join(outDir, contractName + '.json');
            fs.writeFileSync(outFile, JSON.stringify(compilerOutput, null, 2));

            let resultEntry = {
                compiled: true,
                status: 'sucess',
                message: 'Compiled successfully'
            };
            
            const errors = compilerOutput.errors?.filter(e => e.severity === 'error');
            if (errors && errors.length) {
                resultEntry = {
                    compiled: false,
                    status: 'error',
                    message: errors.map(e => e.formattedMessage).join('\n')
                };
            }
            if (!results[contractName]) {
                results[contractName] = {};
            }
            results[contractName][shortVersion] = resultEntry;

            console.log(`${resultEntry.compiled ? 'Successfully, ' : 'Error, '} Compiled: ${filePath}`);
        }
    }
    fs.writeFileSync(resultsPath, JSON.stringify(results, null, 2));
})();