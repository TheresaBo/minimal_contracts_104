// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_483 {

    uint256 public publicVar;
    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.call(abi.encodeWithSignature("foo()"));
        
        require(success);

        publicVar = 42;
    }
}