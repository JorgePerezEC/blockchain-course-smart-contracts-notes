// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
/*
 Excercise
 Ejercicio: Contrato Inteligente para Enviar y Retirar Dinero en Solidity

Objetivo:
El objetivo de este ejercicio es crear un contrato inteligente en Solidity que 
permita a los usuarios depositar fondos en el contrato y retirar dichos fondos, 
ya sea a su propia dirección o a una dirección específica. Este ejercicio ayudará 
a comprender el manejo de funciones de pago (payable) y la transferencia de Ether 
dentro de un contrato inteligente.

Descripción del Ejercicio:
Vas a implementar un contrato inteligente llamado SendWithdrawMoney que tendrá las 
siguientes funcionalidades:

Depósito de Fondos: Una función para que cualquier usuario pueda depositar fondos en el contrato.
Ver Balance del Contrato: Una función para consultar el balance actual del contrato.
Retirar Fondos (a la propia dirección): Una función para que el usuario pueda retirar 
todos los fondos del contrato a su propia dirección.
Retirar Fondos (a una dirección específica): Una función para que el usuario pueda retirar 
todos los fondos del contrato y enviarlos a una dirección específica.

*/
contract SendWithdrawMoney {

    uint public balanceReceive;

    // Event declare (events can see in logs section)
    event Deposit(address indexed from, uint256 value);
    event WithdrawAll(address indexed to, uint256 value);
    event WithdrawAllTo(address indexed from, address to, uint256 value);

    // function to deposit ETH into contract
    function depositMoney() public payable  {
        if (msg.value != 0 ether) {
            balanceReceive += msg.value;
            emit Deposit(msg.sender, msg.value);
        } else {
            revert("Error: Not enought money to deposit into contract.");
        }
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Function to deposit ether into self account
    function transferMoneySelfAccount() public  {
        address payable to = payable(msg.sender);
        uint256 balance = getContractBalance();
        if (getContractBalance() > 0) {
            to.transfer(getContractBalance());
            balanceReceive = 0;
            emit WithdrawAll(msg.sender, balance);
            // payable(msg.sender).transfer(msg.value); 
        } else {
            revert("Error: Not enought money into contract to transfer.");
        }
    }

    // Function to deposit ether into another account
    function transferMoneyOtherAccount(address payable _newAccount) public  {
        
        uint256 balance = getContractBalance();
        
        if (getContractBalance() > 0) {
            _newAccount.transfer(getContractBalance());
            balanceReceive = 0;
            emit WithdrawAllTo(msg.sender, _newAccount, balance);
        } else {
            revert("Error: Not enought money into contract to transfer.");
        }

        //  Simplify version
        // require(getContractBalance() > 0, "Insuficient balance");
        // payable(_newAccount).transfer(getContractBalance());
    }
    
}