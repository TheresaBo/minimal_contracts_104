// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_162 {


    constructor() public {

    }

    function test(address callAddress) public {
        callAddress.call(abi.encodeWithSignature("foo()"));
        

    }
}