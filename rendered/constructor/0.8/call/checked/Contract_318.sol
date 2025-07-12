// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_318 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.call(abi.encodeWithSignature("foo()"));
        
        if (success) {} else { revert("Error"); }

        publicVar = 42;
    }
}