// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    uint8 private constant _decimals = 1;
    uint256 private constant _initialSupply = 200 * (10 ** uint256(_decimals));

    constructor() ERC20("PandaPunks", "PPNKS") {
        _mint(msg.sender, _initialSupply);
    }

    function mint(address owner, address to, uint256 amount) public onlyOwner {
    require(msg.sender == owner, "Only the owner can mint tokens.");
    _mint(to, amount);
    }

    function burn(address to, uint256 amount) public {
        _burn(to, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(recipient != address(0), "ERC20: Transfer to the zero address");
        return super.transfer(recipient, amount);
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        require(recipient != address(0), "ERC20: Transfer to the zero address");
        return super.transferFrom(sender, recipient, amount);
    }
}

//spender - 0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199
//recipient - 0xdD2FD4581271e230360230F9337D5c0430Bf44C0
