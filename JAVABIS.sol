// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NFTContract {
    string public contractName;
    string public contractSymbol;
    mapping(uint256 => address) private tokenOwners;
    mapping(uint256 => bool) private tokenExists;

    event Transfer(address indexed from, address indexed to, uint256 tokenId);

    constructor(string memory name, string memory symbol) {
        contractName = name;
        contractSymbol = symbol;
    }

    function createToken(address to, uint256 tokenId) external {
        require(!tokenExists[tokenId], "Token with this ID already exists");
        tokenOwners[tokenId] = to;
        tokenExists[tokenId] = true;
        emit Transfer(address(0), to, tokenId);
    }

    function transferToken(address from, address to, uint256 tokenId) external {
        require(tokenExists[tokenId], "Token with this ID does not exist");
        require(tokenOwners[tokenId] == from, "You are not the owner of this token");
        tokenOwners[tokenId] = to;
        emit Transfer(from, to, tokenId);
    }

    function getTokenOwner(uint256 tokenId) external view returns (address) {
        require(tokenExists[tokenId], "Token with this ID does not exist");
        return tokenOwners[tokenId];
    }
}

