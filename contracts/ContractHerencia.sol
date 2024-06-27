// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ContractA {
    
    uint public data;

    function setData(uint256 _data) public {
        data = _data;
    }

    function getData() public view returns(uint256) {
        return data;
    }
}

contract ContractB is ContractA {

    function incrementData() public {
        // Variable override Not allowed only functions
        data += 1;
    }

}