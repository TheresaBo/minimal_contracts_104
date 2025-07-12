pragma solidity 0.8.29;

contract Contract_c_8 {

    function test(address callAddress) public {
        (bool success, bytes memory data) = callAddress.staticcall("");    
        require(success);
    }
}