// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Paulyntoken is ERC20 {
    uint rate;
    uint FixedSupply;
    
    constructor() ERC20 ("Paulyntoken", "PNT") {
        rate = 1000;
        FixedSupply = 1000000 * 10 ** 18;
        _mint(msg.sender, 5000 *10 ** 18);
    }

    function buyToken(address receiver) public payable {
        require (msg.value > 0, "You need more money for this transaction");
        uint amountToBuy = msg.value * rate;
        require (FixedSupply >= (totalSupply() + amountToBuy), "Cannot Exceed Fixed Supply" );
        _mint(receiver, amountToBuy);
    }
}