// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_194 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address callAddress) public {
        (bool success, ) = callAddress.call(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}