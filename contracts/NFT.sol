// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721, Ownable {

    uint256 public currentTokenId = 0;

    constructor(address initialOwner)
        ERC721("MyNFT", "NFT")
        Ownable(initialOwner)
    {}
    // function to create NFT and transfer to new owner
    function createNFT(address to) public onlyOwner {
        _mint(to, currentTokenId);
        currentTokenId ++;
    }

}