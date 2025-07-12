// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;


contract Contract_554 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        callAddress.delegatecall(bytes4(keccak256("foo()")));
        

        publicVar = 42;
    }
}