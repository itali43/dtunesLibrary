// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

struct DTunesLibraryEntry {
    string blobId;
    string title;
    string artist;
    address ownerId;
    bool active;
}

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

/// @custom:security-contact elliott@tothemoon.email
contract DTunesLibrary is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    DTunesLibraryEntry[] public dTunes;

    event entryAdded(string blobId, string title, string artist, address ownerId, bool active);

    function addEntry(string calldata blobId, string calldata title, string calldata artist, address ownerId, bool active) public returns (bool success) {
        // add to library array
        dTunes.push(DTunesLibraryEntry({
            blobId: blobId,
            title: title,
            artist: artist,
            ownerId: ownerId,
            active: active
        }));
        
        // emit
        emit entryAdded(blobId, title, artist, ownerId, active);

        return true;
    }

    function getDTunes() public view returns (DTunesLibraryEntry[] memory) {
        return dTunes;
    }

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address initialOwner) initializer public {
        __Ownable_init(initialOwner);
        __UUPSUpgradeable_init();
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}
}
