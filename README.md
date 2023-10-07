# ETH-AVAX-ERC20-TOKEN

This Solidity program is a simple token contract that demonstrates the functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.

## Description

PandaPunks is a simple ERC20 token contract with a fixed supply of 200 tokens. It has the following features:
1. It is mintable by the owner only.
2. It is burnable and transferable by anyone.
3. It has a fixed decimals of 1.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., PandaPunks.sol). Copy and paste the following code into the file:

```javascript
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


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.20" (or another compatible version), and then click on the "Compile PandaPunks.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyToken" contract from the dropdown menu, and then click on the "Deploy" button.

1. Check the owner by clicking the owner button.
2. Mint to any user address using the owner's address by going to the mint function button.
3. Burn using anyone's address by going to the burn function button.
4.  Transfer using anyone's address by going tto the transfer function button.
5. Owner can allow a spender to use or transfer their token, by allowing them to use only up to a specific amount.
   a. Get an approval for the spender by going to the approve function button.
   b. Confirm the allowance given by the owner to the spender by going to the allowance function button.
   c. Using the transferFrom function button. Transfer by using the owner's address and use only up to the specific amount approved by the owner. If it exceeds, transaction will fail.
6. Ownership can be transferable using the transferOwnership function button.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
