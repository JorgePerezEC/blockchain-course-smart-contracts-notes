// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ExampleAddress {


    // In ether the smallest unit of coin is called wei
    // 1^18 wei = 1 ether

    // Address(wallets or contracts) = 20 bytes of length
    address public someAddress;
    address public ownerAddress;

    uint    public value;

    uint    public count;

    constructor(uint _value) {
        someAddress = msg.sender;
        ownerAddress =  msg.sender;
        value       = _value;
    }
    
    modifier onlyOwner() {
        require(msg.sender == ownerAddress, "Not owner");
        _;
    }

    modifier  verifyCount(){
        _;
        require(count < 4, "Count must be lower than 4");
    }

    function counter() public verifyCount {
        count++;
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

    function setNewValue(uint _newValue) public onlyOwner  {

        // require(someAddress == msg.sender, "Not deployer. Transaction canceled");
        value = _newValue;
        // return true;
    }

    function setCount(uint _newCount) public onlyOwner  {

        // require(someAddress == msg.sender, "Not deployer. Transaction canceled");
        count = _newCount;
        // return true;
    }

}