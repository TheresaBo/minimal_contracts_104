// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_484 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.call(abi.encodeWithSignature("foo()"));
        
        require(success);

        publicVar = 42;
    }
}