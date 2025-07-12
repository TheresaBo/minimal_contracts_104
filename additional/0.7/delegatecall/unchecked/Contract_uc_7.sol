pragma solidity 0.7.6;

contract Contract_uc_7 {

    function test(address callAddress) public {
        callAddress.delegatecall("");    
    }
}