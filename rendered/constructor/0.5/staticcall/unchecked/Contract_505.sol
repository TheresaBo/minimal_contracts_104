// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_505 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}