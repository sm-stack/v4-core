// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {MockERC20} from "./MockERC20.sol";
import {MockInvalidERC20} from "./MockInvalidERC20.sol";
import {Currency} from "../../../contracts/types/Currency.sol";
import {SortTokens} from "./SortTokens.sol";

contract TokenFixture {
    Currency internal currency1;
    Currency internal currency0;
    Currency internal invalidCurrency;

    function initializeTokens() internal {
        MockERC20 tokenA = new MockERC20("TestA", "A", 18, 1000 ether);
        MockERC20 tokenB = new MockERC20("TestB", "B", 18, 1000 ether);
        MockInvalidERC20 invalidToken = new MockInvalidERC20("TestInvalid", "I", 18, 1000 ether);
        invalidCurrency = Currency.wrap(address(invalidToken));

        (currency0, currency1) = SortTokens.sort(tokenA, tokenB);
    }
}
