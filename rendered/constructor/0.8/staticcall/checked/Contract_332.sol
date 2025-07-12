// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_332 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        
        require(success);

        publicVar = 42;
    }
}