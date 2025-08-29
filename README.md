
## Code and Data for the diploma thesis "Investigating Vulnerability Detection Tools and Solidity Compiler Versions on the Vulnearbility of Unchecked Call Return Values"

This repository contains all scripts and result data for the practical part of the thesis.

#### Files
- ``compile_constructor.js``: compiles all constructor contracts
- ``compile_function.js``: compiles all function contracts
- ``compilerVersions.json``: all data for compiler versions
- ``compute_jaccard.py``: computations for jaccard index and overlap
- ``data.json``: data for placeholders for templates
- ``render_both.js``: generates minimal contracts, saved in folder ``rendered``; additionally ``valid_combos_function.json`` and ``valid_combos_constructor.json`` is generated
-  ``template_*``: contains the mustache skeletons for the minimal contracts
- ``additional``: holds extra contracts for Mythril 0.7/0.8 investigation
- ``tool_results``: result files from SmartBugs for run 1 and 2, as well as analysis in ``results_analysed_numbers.xlsx``

#### Installation and Usage
Install npm, node, Python 3.13


* generates the folder ``generated``, its subfolders, minimal contracts and ``valid_combos_constructor.js``, ``valid_combos_function.js``
```console
npm render_both.js
```
* compiles the contracts in the ``generated`` folder, generates the folder ``compiled`` with the results
```console
npm compile_function.js
npm compile_constructor.js
```

* computes jaccard similarity and overlap: takes all vulnerable contracts from ``valid_combos_constructor.js``, ``valid_combos_function.js`` and compares it with the csv result reports from the tools placed in the ``tool_results`` folder
```console
python compute_jaccard.py
```
