// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.4.26;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_545 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        callAddress.call(bytes4(keccak256("foo()")));
        

        publicVar = 42;
    }
}