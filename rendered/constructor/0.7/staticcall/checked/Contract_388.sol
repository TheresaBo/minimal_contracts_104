// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;


contract Contract_388 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        
        require(success);

        publicVar = 42;
    }
}