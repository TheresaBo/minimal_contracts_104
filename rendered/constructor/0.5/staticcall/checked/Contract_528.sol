// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.5.17;


contract Contract_528 {

    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.staticcall(abi.encodeWithSignature("foo()"));
        
        require(success);

    }
}