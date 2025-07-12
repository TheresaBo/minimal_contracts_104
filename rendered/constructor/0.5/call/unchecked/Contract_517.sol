// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_517 {

    
    constructor(address callAddress) public {
        callAddress.call(abi.encodeWithSignature("foo()"));
        

    }
}