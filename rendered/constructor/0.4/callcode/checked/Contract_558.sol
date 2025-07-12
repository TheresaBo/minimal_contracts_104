// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;


contract Contract_558 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        bool success = callAddress.callcode(bytes4(keccak256("foo()")));
        
        if (success) {} else { revert("Error"); }

        publicVar = 42;
    }
}