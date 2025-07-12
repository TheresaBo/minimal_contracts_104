// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_502 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        
        if (success) {} else { revert("Error"); }

        publicVar = 42;
    }
}