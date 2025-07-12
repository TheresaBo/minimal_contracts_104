// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;


contract Contract_147 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}