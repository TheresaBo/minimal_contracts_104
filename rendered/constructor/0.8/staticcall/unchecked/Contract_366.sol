// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_366 {

    
    constructor(address callAddress) public {
        callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

    }
}