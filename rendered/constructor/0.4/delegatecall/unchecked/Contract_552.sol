// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;


contract Contract_552 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        bool success = callAddress.delegatecall(bytes4(keccak256("foo()")));
        

        publicVar = 42;
    }
}