// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;


contract Contract_273 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address callAddress) public {
        bool success = callAddress.callcode(bytes4(keccak256("foo()")));
        

        publicVar = 42;
    }
}