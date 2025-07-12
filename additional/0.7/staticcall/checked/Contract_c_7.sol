pragma solidity 0.7.6;

contract Contract_c_7 {

    function test(address callAddress) public {
        (bool success, bytes memory data) = callAddress.staticcall("");    
        require(success);
    }
}