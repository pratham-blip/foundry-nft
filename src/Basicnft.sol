//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Basicnft is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_TokenIdtoUri;

    constructor() ERC721("Doggie", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenUri) public {
        s_TokenIdtoUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);

        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_TokenIdtoUri[tokenId];
    }
}
