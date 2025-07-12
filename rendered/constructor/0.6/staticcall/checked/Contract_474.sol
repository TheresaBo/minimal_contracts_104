// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;


contract Contract_474 {

    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        
        if (success) {} else { revert("Error"); }

    }
}