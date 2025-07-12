// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;


contract Contract_70 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address callAddress) public {
        callAddress.call(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}