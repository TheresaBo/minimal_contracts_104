// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_19 {

    uint256 public publicVar;

    constructor() public {

    }

    function test(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        
        if (success) {} else { revert("Error"); }

        publicVar = 42;
    }
}