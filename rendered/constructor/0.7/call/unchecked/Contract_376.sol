// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;


contract Contract_376 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.call(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}