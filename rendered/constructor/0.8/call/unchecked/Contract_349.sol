// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_349 {

    
    constructor(address callAddress) public {
        callAddress.call(abi.encodeWithSignature("foo()"));
        

    }
}