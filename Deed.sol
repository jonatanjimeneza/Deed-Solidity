// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

//contrato para hacer un trato/acuerdo con un tiempo estipulado para retirar el dinero.
contract Deed{
    //Dirección del abogado
    address public lawyer;
    //Dirección del beneficiario
    address payable public beneficiary;
    //Establecer un tiempo.
    uint public earliest;

    //Constructor del smart contract
    constructor(address _lawyer, address payable _beneficiary, uint fromNow)payable{
        lawyer = _lawyer;
        beneficiary= _beneficiary;
        earliest = block.timestamp + fromNow;
    }

    //Función para retirar el dinero con un tiempo estipulado (tiempo minimo a cumplir).
    function withdraw() public{
        require(msg.sender==lawyer,"Lawyer only");
        require(block.timestamp>=earliest,"too early");
        beneficiary.transfer(address(this).balance);
    }
}