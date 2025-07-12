// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;


contract Contract_402 {

    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.call(abi.encodeWithSignature("foo()"));
        
        if (success) {} else { revert("Error"); }

    }
}