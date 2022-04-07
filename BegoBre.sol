// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./HederaTokenService.sol";
import "./HederaResponseCodes.sol";

contract BegoBre is HederaTokenService {
        address tokenAddress;

//Create the transaction and optionally freeze for manual signing

const transaction = await new TokenCreateTransaction()
.setTokenName("BegoBre")
.setTokenSymbol("BEGO")
.setTreasuryAccountId(treasuryAccountId)
.setInitialSupply(5000000000000)
.setAdminKey(adminPublicKey)
.freezeWith(client);

int response = HederaTokenService.transferToken(tokenAddress, msg.sender, address(this), amount);
...
}
