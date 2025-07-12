// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_364 {

    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

    }
}