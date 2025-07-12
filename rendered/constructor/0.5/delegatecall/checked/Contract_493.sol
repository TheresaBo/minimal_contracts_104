// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_493 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        
        if (success) {} else { revert("Error"); }

        publicVar = 42;
    }
}