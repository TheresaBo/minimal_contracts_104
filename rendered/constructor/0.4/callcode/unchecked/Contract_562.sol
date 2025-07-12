// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;


contract Contract_562 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        callAddress.callcode(bytes4(keccak256("foo()")));
        

        publicVar = 42;
    }
}