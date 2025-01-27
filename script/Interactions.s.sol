//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/Basicnft.sol";

contract MintBasicNft is Script {
    string public constant SHIBA =
        "https://ipfs.io/ipfs/bafkreibfkec3ybuwxirrym2pkmn3nlrq6ng4a7zbyiegs26pw2pkl3ehxy";

    function run() external {
        address mostRecentlyDeployed = DevOps.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        Basicnft(contractAddress).mintNft(SHIBA);
        vm.stopBroadcast();
    }
}
