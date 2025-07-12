// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_514 {

    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.call(abi.encodeWithSignature("foo()"));
        
        if (success) {} else { revert("Error"); }

    }
}