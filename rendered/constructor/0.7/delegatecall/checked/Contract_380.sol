// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;


contract Contract_380 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        
        require(success);

        publicVar = 42;
    }
}