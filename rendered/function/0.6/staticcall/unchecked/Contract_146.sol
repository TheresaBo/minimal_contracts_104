// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_146 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}