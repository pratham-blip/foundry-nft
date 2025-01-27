//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {DeployNft} from "../script/DeployNft.s.sol";
import {Basicnft} from "../src/Basicnft.sol";
import {Test} from "forge-std/Test.sol";

contract BasicnftTest is Test {
    DeployNft public deployer;
    Basicnft public basicNft;
    address public USER = makeAddr("user");
    string public constant SHIBA =
        "https://ipfs.io/ipfs/bafkreibfkec3ybuwxirrym2pkmn3nlrq6ng4a7zbyiegs26pw2pkl3ehxy";

    function setUp() public {
        deployer = new DeployNft();
        basicNft = deployer.run();
    }

    function testNameisCorrect() public view {
        string memory expected_name = "Doggie";
        string memory actualname = basicNft.name();

        // converting both strings to dynamic bytes using abi.encodePacked(arg);

        bytes memory expected_name_bytes = abi.encodePacked(expected_name);
        bytes memory actualname_bytes = abi.encodePacked(actualname);

        //now hashing both to make them byte256 using keccak256(arg);

        assert(keccak256(expected_name_bytes) == keccak256(actualname_bytes));
    }

    function testCanMintAndHaveABasicNft() public {
        vm.prank(USER);
        basicNft.mintNft(SHIBA);

        assert(basicNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(SHIBA)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}
