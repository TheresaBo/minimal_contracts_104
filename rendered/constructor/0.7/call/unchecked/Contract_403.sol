// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_403 {

    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.call(abi.encodeWithSignature("foo()"));
        

    }
}