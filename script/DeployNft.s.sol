//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/src/Script.sol";
import {Basicnft} from "../src/Basicnft.sol";

contract DeployNft is Script {
    function run() external returns (Basicnft) {
        vm.startBroadcast();
        Basicnft nft = new Basicnft();
        vm.stopBroadcast();
        return nft;
    }
}
