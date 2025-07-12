// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_113 {


    constructor() public {

    }

    function test(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        
        require(success);

    }
}