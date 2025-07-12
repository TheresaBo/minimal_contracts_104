// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.12;

contract Target { function foo() public pure returns (bool) { return true; }}

contract Contract_463 {

    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.delegatecall(abi.encodeWithSignature("foo()"));
        
        require(success);

    }
}