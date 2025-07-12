// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_191 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address callAddress) public {
        (bool success, ) = callAddress.call(abi.encodeWithSignature("foo()"));
        
        if (success) {} else { revert("Error"); }

        publicVar = 42;
    }
}