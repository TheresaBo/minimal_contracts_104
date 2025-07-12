pragma solidity 0.7.6;

contract Contract_address_uc_7 {

    address public callAddress = 0xE0f7e56E62b4267062172495D7506087205A4229;

    function test() public {
        callAddress.delegatecall("");
    }
}