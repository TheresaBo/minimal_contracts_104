// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_363 {

    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

    }
}