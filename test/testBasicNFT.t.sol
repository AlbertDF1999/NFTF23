//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract TestBasicNFT is Test {
    DeployBasicNFT private deployer;
    BasicNFT private basicNFT;
    string constant EXPECTED = "Dogie";
    address private USER = makeAddr("USER");
    string public constant BANGER =
        "ipfs://bafkreicbbh23jzudhypskxgjmtcvrdzzpmlelb4ftd6vji5y2zzpragq2u";

    function setUp() public {
        deployer = new DeployBasicNFT();
        basicNFT = deployer.run();
    }

    function testNameIsCorrect() external {
        bytes32 contractNameHash = keccak256(abi.encodePacked(basicNFT.name()));
        bytes32 expectedNameHash = keccak256(abi.encodePacked(EXPECTED));
        assert(contractNameHash == expectedNameHash);
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNFT.mintNFT(BANGER);

        assert(basicNFT.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(BANGER)) ==
                keccak256(abi.encodePacked(basicNFT.tokenURI(0)))
        );
    }
}
