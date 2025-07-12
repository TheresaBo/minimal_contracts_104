// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.29;


contract Contract_344 {

    
    constructor(address callAddress) public {
        (bool success, ) = callAddress.call(abi.encodeWithSignature("foo()"));
        
        require(success);

    }
}