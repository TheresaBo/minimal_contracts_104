// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_589 {

    
    constructor(address callAddress) public {
        callAddress.callcode(bytes4(keccak256("foo()")));
        

    }
}