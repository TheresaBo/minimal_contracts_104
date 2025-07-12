// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_506 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}