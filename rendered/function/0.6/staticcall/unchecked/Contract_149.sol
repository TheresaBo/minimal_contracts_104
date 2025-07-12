// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;


contract Contract_149 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address callAddress) public {
        callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}