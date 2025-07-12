// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;


contract Contract_556 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        bool success = callAddress.callcode(bytes4(keccak256("foo()")));
        
        require(success);

        publicVar = 42;
    }
}