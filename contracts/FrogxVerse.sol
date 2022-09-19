//SPDX-License-Identifier: MIT

pragma solidity >=0.8.10 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";

contract FrogxVerse is ERC721, VRFConsumerBaseV2 {
    VRFCoordinatorV2Interface private immutable i_vrfCoordinator;
    bytes32 private immutable i_gasLane;
    uint64 private immutable i_subscriptionId;
    uint32 private immutable i_callbackGasLimit;
    uint16 private constant REQUEST_CONFIRMATIONS = 3;
    uint32 private constant NUM_WORDS = 1;

    event RequestedMint(uint256 indexed requestId);

    constructor(
        address _VRFCoordinator,
        bytes32 _gasLane,
        uint64 _subscriptionId,
        uint32 _callbackGasLimit
    )
    ERC721("FrogxVerse", "FROGXEL")
    VRFConsumerBaseV2(_VRFCoordinator){
        i_vrfCoordinator = VRFCoordinatorV2Interface(_VRFCoordinator);
        i_gasLane = _gasLane;
        i_subscriptionId = _subscriptionId;
        i_callbackGasLimit = _callbackGasLimit;
    }

    function mintFrogxel(address to, uint256 tokenId) external {
        uint256 requestId = i_vrfCoordinator.requestRandomWords(i_gasLane, i_subscriptionId, REQUEST_CONFIRMATIONS, i_callbackGasLimit, NUM_WORDS);
        emit RequestedMint(requestId);
    }

    function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override {

    }
}