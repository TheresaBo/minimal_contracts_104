// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_385 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}