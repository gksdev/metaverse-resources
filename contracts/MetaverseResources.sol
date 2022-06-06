pragma solidity ^0.5.6;

import "./klaytn-contracts/token/KIP37/KIP37.sol";
import "./klaytn-contracts/token/KIP37/KIP37Mintable.sol";
import "./klaytn-contracts/token/KIP37/KIP37Burnable.sol";
import "./klaytn-contracts/token/KIP37/KIP37Pausable.sol";
import "./klaytn-contracts/ownership/Ownable.sol";

contract MetaverseResources is Ownable, KIP37, KIP37Mintable, KIP37Burnable, KIP37Pausable {

    event SetBlacklist(address user, bool status);

    mapping(address => bool) public blacklist;

    constructor() public KIP37("") {}

    function setBlacklist(address user, bool status) external onlyOwner {
        blacklist[user] = status;
        emit SetBlacklist(user, status);
    }

    function setURI(uint256 id, string calldata uri) external onlyOwner {
        _uris[id] = uri;
        emit URI(uri, id);
    }
}
