// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Brazil Hidden Sound Rituals Registry
/// @notice On-chain registry of real, lesser-known Amazonian ritual sound instruments from Brazil, with community voting.
/// @dev Country-specific: focused on Yanomami, Tikuna, Kayapo, Huni Kuin, and Yawanawa ceremonial sound technologies.

contract BrazilHiddenSoundRituals {

    struct SoundInstrument {
        string region;          // e.g., Amazonas, Acre, Roraima
        string community;       // specific indigenous community
        string instrumentName;  // name of the ritual instrument
        string instrumentType;  // flute, rattle, drum, whistle, etc.
        string culturalNote;    // brief factual context or origin
        string whyItMatters;    // cultural significance
        address creator;
        uint256 likes;
        uint256 dislikes;
        uint256 createdAt;
    }

    SoundInstrument[] public instruments;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event SoundInstrumentRecorded(uint256 indexed id, string instrumentName, string community, address indexed creator);
    event SoundInstrumentVoted(uint256 indexed id, bool like, uint256 likes, uint256 dislikes);

    constructor() {
        instruments.push(
            SoundInstrument({
                region: "Amazonas",
                community: "ExampleCommunity",
                instrumentName: "Example Instrument (replace with real entries)",
                instrumentType: "example type",
                culturalNote: "This is an example entry to illustrate the format.",
                whyItMatters: "Real entries should describe cultural and ritual relevance.",
                creator: address(0),
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );
    }

    /// @notice Record a new hidden Amazonian ritual sound instrument from Brazil.
    function recordSoundInstrument(
        string calldata region,
        string calldata community,
        string calldata instrumentName,
        string calldata instrumentType,
        string calldata culturalNote,
        string calldata whyItMatters
    ) external {
        require(bytes(region).length > 0, "Region required");
        require(bytes(community).length > 0, "Community required");
        require(bytes(instrumentName).length > 0, "Instrument name required");

        instruments.push(
            SoundInstrument({
                region: region,
                community: community,
                instrumentName: instrumentName,
                instrumentType: instrumentType,
                culturalNote: culturalNote,
                whyItMatters: whyItMatters,
                creator: msg.sender,
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );

        emit SoundInstrumentRecorded(instruments.length - 1, instrumentName, community, msg.sender);
    }

    /// @notice Vote on whether a recorded instrument is culturally relevant or useful.
    function voteSoundInstrument(uint256 id, bool like) external {
        require(id < instruments.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        SoundInstrument storage inst = instruments[id];

        if (like) {
            inst.likes += 1;
        } else {
            inst.dislikes += 1;
        }

        emit SoundInstrumentVoted(id, like, inst.likes, inst.dislikes);
    }

    /// @notice Returns the total number of recorded instruments.
    function totalInstruments() external view returns (uint256) {
        return instruments.length;
    }
}
