// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_119 {


    constructor() public {

    }

    function test(address callAddress) public {
        callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

    }
}