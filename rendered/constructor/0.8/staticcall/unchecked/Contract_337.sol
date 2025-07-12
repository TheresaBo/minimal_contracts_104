// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_337 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        callAddress.staticcall(abi.encodeWithSignature("foo()"));
        

        publicVar = 42;
    }
}