// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_526 {

    
    constructor(address callAddress) public {
        callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        

    }
}