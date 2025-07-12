// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;


contract Contract_434 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        callAddress.call(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}