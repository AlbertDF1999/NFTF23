//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNFT} from "../../script/DeployMoodNFT.s.sol";
import {MoodNFT} from "../../src/MoodNFT.sol";

contract DeployMoodNFTtest is Test {
    DeployMoodNFT private deployer;
    MoodNFT private moodNFT;

    function setUp() public {
        deployer = new DeployMoodNFT();
    }

    function testConvertSvgToURI() public {
        string
            memory expect = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI4MDAiIGhlaWdodD0iMjAwIiB2aWV3Qm94PSIwIDAgODAwIDIwMCI+PHJlY3Qgd2lkdGg9IjgwMCIgaGVpZ2h0PSIyMDAiIGZpbGw9IiMxYTFhMmUiLz48dGV4dCB4PSI0MDAiIHk9IjEwMCIgZm9udC1mYW1pbHk9IkFyaWFsLCBzYW5zLXNlcmlmIiBmb250LXNpemU9IjI4IiBmb250LXdlaWdodD0iYm9sZCIgZmlsbD0iIzAwZDRmZiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZG9taW5hbnQtYmFzZWxpbmU9Im1pZGRsZSI+WU9VUiBCUk9XU0VSIENBTiBESVNQTEFZIFRISVMgU1ZHIENPREU8L3RleHQ+PC9zdmc+";
        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="800" height="200" viewBox="0 0 800 200"><rect width="800" height="200" fill="#1a1a2e"/><text x="400" y="100" font-family="Arial, sans-serif" font-size="28" font-weight="bold" fill="#00d4ff" text-anchor="middle" dominant-baseline="middle">YOUR BROWSER CAN DISPLAY THIS SVG CODE</text></svg>';

        string memory uri = deployer.svgToImageURI(svg);
        assert(
            keccak256(abi.encodePacked(uri)) ==
                keccak256(abi.encodePacked(expect))
        );
    }
}
