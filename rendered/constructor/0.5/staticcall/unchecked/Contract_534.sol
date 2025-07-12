// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_534 {

    
    constructor(address callAddress) public {
        callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

    }
}