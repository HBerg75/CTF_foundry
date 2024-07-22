// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

import {Script, console} from "forge-std/Script.sol";
import {HackMeIfYouCan} from "../src/HackMeIfYouCan.sol"; 

contract deployHackMe is Script {
    HackMeIfYouCan public hackMeContract;

    function setUp() public {}

    function run() public returns (HackMeIfYouCan) {
        //vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        vm.startBroadcast();
        bytes32 password = keccak256(abi.encodePacked("password"));
        bytes32[15] memory data;
        for (uint i = 0; i < 15; i++) {
            data[i] = keccak256(abi.encodePacked(i));
            //console.logBytes32(data[i]);
        }

        hackMeContract = new HackMeIfYouCan(password, data);
        console.log("HackMeIfYouCan deployed at:", address(hackMeContract));

        vm.stopBroadcast();

        return hackMeContract;
    }
}
