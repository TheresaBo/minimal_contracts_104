// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;


contract Contract_590 {

    
    constructor(address callAddress) public {
        callAddress.callcode(bytes4(keccak256("foo()")));
        

    }
}