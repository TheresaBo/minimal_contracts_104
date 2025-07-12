// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;


contract Contract_470 {

    
    constructor(address callAddress) public {
        callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        

    }
}