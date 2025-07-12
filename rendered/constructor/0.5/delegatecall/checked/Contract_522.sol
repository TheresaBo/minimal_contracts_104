// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_522 {

    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        
        if (success) {} else { revert("Error"); }

    }
}