// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_490 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        callAddress.call(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}