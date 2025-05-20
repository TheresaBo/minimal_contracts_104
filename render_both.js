const Mustache = require('mustache');
const fs = require('fs');
const path = require('path');

const data = JSON.parse(fs.readFileSync('./data.json', 'utf-8'));


const templates = {
    constructor: {
        call: fs.readFileSync('./template_call_constructor.mustache', 'utf-8'),
        send: fs.readFileSync('./template_send_constructor.mustache', 'utf-8')
    },
    function: {
        call: fs.readFileSync('./template_call.mustache', 'utf-8'),
        send: fs.readFileSync('./template_send.mustache', 'utf-8')
    }
};

let contractCounter = 0;

function cartesianProduct(arrays) {
    return arrays.reduce((a, b) => a.flatMap(d => b.map(e => [...d, e])), [[]]);
}

function isValidCombo(combo, variant) {
    // for all
    // XOR
    if (!!combo.assignVariable !== !!combo.variable) return false;
    if (combo.checkSuccess && !combo.success) return false;
    if (combo.success === 'bool success = ' && combo.compilerVersion !== '0.4.26' && combo.lowLevelConstruct !== 'send') return false;
    if (combo.success === '(bool success, ) = ' && combo.compilerVersion === '0.4.26') return false;
    if (combo.returnSuccess && combo.checkSuccess !== 'return success;') return false;
    if (combo.returnSuccess && combo.assignVariable) return false;
    if (!combo.returnSuccess && combo.checkSuccess === 'return success;') return false;

    // remove staticcall 0.4.26
    if (combo.lowLevelConstruct === 'staticcall' && combo.compilerVersion === '0.4.26') return false;

    // remove callcode >0.4.26
    if (combo.lowLevelConstruct === 'callcode' && combo.compilerVersion !== '0.4.26') return false;

    // for call based
    if (combo.lowLevelConstruct !== 'send') {
        if (combo.compilerVersion === '0.4.26' && combo.payload === 'abi.encodeWithSignature("foo()")') return false; // allows empty and bytes4(..)
        if (combo.compilerVersion !== '0.4.26' && combo.payload !== 'abi.encodeWithSignature("foo()")') return false;
        if (combo.payable) return false;
        // if (!combo.payload && combo.compilerVersion !== '0.4.26') return false;
        if (!combo.payload) return false; // removes all empty
    }
    
    // for send based
    if (combo.lowLevelConstruct === 'send') {
        if (combo.targetContract) return false;
        if (combo.payload) return false;
        if (combo.payable && combo.compilerVersion === '0.4.26') return false;
        if (!combo.payable && combo.compilerVersion !== '0.4.26') return false;
        if (combo.success === '(bool success, ) = ') return false;
    }

    // no return for constructor
    if (variant === 'constructor') {
        if (combo.returnSuccess) return false;
    }

    return true;
}

function generateCombos(data) {
    const keys = Object.keys(data);
    const values = keys.map(k => data[k]);
    const rawCombos = cartesianProduct(values);
    const rawCombosMapped = rawCombos.map(vals => Object.fromEntries(keys.map((k, i) => [k, vals[i]])));
    return rawCombosMapped;
}


function renderAndSave(template, combo, baseDir) {
    const contractName = `Contract_${contractCounter}`;
    combo.contractName = contractName;

    const rendered = Mustache.render(template, {...combo });
    const versionFolder = combo.compilerVersion.slice(0, 3);
    const llcFolder = combo.lowLevelConstruct;
    const checkFolder = combo.checkSuccess ? 'checked' : 'unchecked';

    const dir = path.join(baseDir, versionFolder, llcFolder, checkFolder);
    fs.mkdirSync(dir, {recursive: true});
    
    const filePath = path.join(dir, `${contractName}.sol`);
    fs.writeFileSync(filePath, rendered);

    contractCounter++;
    return combo;
}

function generateContracts(variant) {
    const baseDir = `./rendered/${variant}`;
    const allCombos = generateCombos(data);
    const validCombos = allCombos.filter(combo => isValidCombo(combo, variant));


    const combosWithContracts = validCombos.map(combo => {
        const templateType = combo.lowLevelConstruct === 'send' ? 'send' : 'call';
        const template = templates[variant][templateType];
        return renderAndSave(template, combo, baseDir);
    });
    fs.writeFileSync(`valid_combos_${variant}.json`, JSON.stringify(combosWithContracts, null, 2));
    console.log(`Rendered ${combosWithContracts.length} valid ${variant} contracts.`);
}


generateContracts('function');
generateContracts('constructor');
console.log(`Total contracts rendered ${contractCounter}.`);