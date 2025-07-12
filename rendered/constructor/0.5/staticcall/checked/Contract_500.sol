// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_500 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        
        require(success);

        publicVar = 42;
    }
}