// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;


contract Contract_432 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.call(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}