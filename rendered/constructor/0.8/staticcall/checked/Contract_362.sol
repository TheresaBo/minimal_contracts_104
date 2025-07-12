// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_362 {

    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        
        if (success) {} else { revert("Error"); }

    }
}