// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;


contract Contract_420 {

    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

    }
}