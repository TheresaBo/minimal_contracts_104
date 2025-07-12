// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;


contract Contract_414 {

    
    constructor(address callAddress) public {
        callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        

    }
}