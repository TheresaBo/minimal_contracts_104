// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_573 {

    
    constructor(address callAddress) public {
        callAddress.call(bytes4(keccak256("foo()")));
        

    }
}