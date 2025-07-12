// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_496 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}