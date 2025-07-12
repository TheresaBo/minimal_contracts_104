// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_322 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        callAddress.call(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}