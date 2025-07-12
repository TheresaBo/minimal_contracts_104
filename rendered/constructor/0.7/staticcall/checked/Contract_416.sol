// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.7.6;


contract Contract_416 {

    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        
        require(success);

    }
}