const fs = require('fs');
const path = require('path');

const inputFile = './tool_results/results_test_run_mythril_slither2.csv';
const mythrilFile = './tool_results/results_mythril.csv';
const slitherFile = './tool_results/results_slither.csv';

const content = fs.readFileSync(inputFile, 'utf-8');
const lines = content.split(/\r?\n/).filter(line => line.trim() !== '');

const header = lines[0];

const dataLines = lines.slice(1);
console.log(dataLines[0]);

const mythrilRows = [header];
const slitherRows = [header];

for (let i = 2; i < lines.length; i+=2) {
    const line = lines[i];
    //console.log(line);
    const columns  = line.split(',');

    const toolid = columns[2];
    console.log(toolid);
    console.log(i);
    console.log(columns[1]);

    if (toolid.includes('mythril')) {
        mythrilRows.push(line);
    } else if (toolid.includes('slither')) {
        slitherRows.push(line);
    }   
}

fs.writeFileSync(mythrilFile, mythrilRows.join('\n'));
fs.writeFileSync(slitherFile, slitherRows.join('\n'));

console.log(`Filtered: ${mythrilRows.length - 1} mythril rows, ${slitherRows.length - 1} slither rows.`);