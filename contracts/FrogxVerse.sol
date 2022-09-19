//SPDX-License-Identifier: MIT

pragma solidity >=0.8.10 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";

contract FrogxVerse is ERC721, VRFConsumerBaseV2 {
    VRFCoordinatorV2Interface COORDINATOR;
    address vrfCoordinator;
    bytes32 keyHash;
    uint256 callBackGasLimit;
    uint16 requestConfirmations;
    uint32 numWords;

    constructor(
        address _VRFCoordinator,
        bytes32 _keyHash
    )
    ERC721("FrogxVerse", "FROGXEL")
    VRFConsumerBaseV2(_VRFCoordinator){
        vrfCoordinator = _VRFCoordinator;

    }

    function mintFrogxel(address to, uint256 tokenId) external {
        
    }

    function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override {

    }
}