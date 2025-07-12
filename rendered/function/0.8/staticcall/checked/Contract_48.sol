// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_48 {


    constructor() public {

    }

    function test(address callAddress) public returns (bool){
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        
        return success;

    }
}