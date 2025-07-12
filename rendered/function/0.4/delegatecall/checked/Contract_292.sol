// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_292 {


    constructor() public {

    }

    function test(address callAddress) public {
        bool success = callAddress.delegatecall(bytes4(keccak256("foo()")));
        
        require(success);

    }
}