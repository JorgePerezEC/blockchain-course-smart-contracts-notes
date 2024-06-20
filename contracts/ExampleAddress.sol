// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ExampleAddress {

    // Address(wallets or contracts) = 20 bytes of length

    // In ether the smallest unit of coin is called wei
    // 1^18 wei = 1 ether
    address public someAddress;

    uint    public value;

    constructor(uint _value) {
        someAddress = msg.sender;
        value       = _value;
    }

    function setSomeAddress(address _someAddress) public {
        someAddress = _someAddress;
    }

    function getAddressBalance() public view returns (uint) {
        return someAddress.balance;
    }

    function setMsgSender() public  {
        someAddress = msg.sender;
    }

    // Function to set a new value but only contrat deployer have permission to do that.
    function setValue(uint _newValue) public returns(bool)  {
        
        // No optime gas consume we need to revert transaction to not use gas if is not the owner
        // if (someAddress == msg.sender) {
        //     value = _newValue;
        //     return true;
        // } else {
        //     return false;
        // }

        require(someAddress == msg.sender, "Not deployer. Transaction canceled");
        value = _newValue;
        return true;
    }

}