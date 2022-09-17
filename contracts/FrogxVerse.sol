//SPDX-License-Identifier: MIT

pragma solidity >=0.8.10 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

contract FrogxVerse is ERC721 {
    constructor()ERC721("FrogxVerse", "FROGXEL"){
    }

    function mintFrogxel(address to, uint256 tokenId) public {
        _safeMint(to, tokenId);
    }
}