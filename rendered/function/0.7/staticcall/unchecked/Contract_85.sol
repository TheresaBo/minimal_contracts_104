// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_85 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address callAddress) public {
        callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}