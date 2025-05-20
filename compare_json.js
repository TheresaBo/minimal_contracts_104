const fs = require('fs');

// Load data
const data = JSON.parse(fs.readFileSync('valid_combos_function.json', 'utf8'));

// Function to compare two objects ignoring "contractName"
function areIdentical(obj1, obj2) {
    const keysToCompare = [
        "compilerVersion", "variable", "lowLevelConstruct", "payable",
        "returnSuccess", "assignVariable", "checkSuccess", "payload",
        "success", "targetContract"
    ];
    
    return keysToCompare.every(key => {
        const val1 = obj1[key];
        const val2 = obj2[key];
        return val1 === val2;
    });
}

// Find and print matching pairs
for (let i = 0; i < data.length; i++) {
    for (let j = i + 1; j < data.length; j++) {
        if (areIdentical(data[i], data[j])) {
            console.log(`Identical: ${data[i].contractName} and ${data[j].contractName}`);
        }
    }
}
