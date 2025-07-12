// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;


contract Contract_392 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}