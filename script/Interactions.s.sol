//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract Interactions is Script {
    string public constant BANGER =
        "ipfs://bafkreicbbh23jzudhypskxgjmtcvrdzzpmlelb4ftd6vji5y2zzpragq2u";

    function run() external {
        address mostRecentDeployment = DevOpsTools.get_most_recent_deployment(
            "BasicNFT",
            block.chainid
        );

        mintNftOnContract(mostRecentDeployment);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNFT(contractAddress).mintNFT(BANGER);
        vm.stopBroadcast();
    }
}
