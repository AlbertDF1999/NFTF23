//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint256 private s_tokenCounter;

    constructor(uint256 initialSupply) ERC721("Dogie", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNFT() public {}

    function tokenURI(
        uint256 tokenID
    ) public view override returns (string memory) {
        return "";
    }
}
