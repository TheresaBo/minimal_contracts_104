// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;


contract Contract_253 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address callAddress) public {
        bool success = callAddress.call(bytes4(keccak256("foo()")));
        
        require(success);

        publicVar = 42;
    }
}