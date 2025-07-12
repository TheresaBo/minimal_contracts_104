// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_23 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address callAddress) public {
        callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}