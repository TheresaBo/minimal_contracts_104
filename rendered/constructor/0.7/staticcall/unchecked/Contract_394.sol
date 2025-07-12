// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;


contract Contract_394 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}