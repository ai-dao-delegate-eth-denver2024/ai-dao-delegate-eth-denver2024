// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PeerReview {
    struct Reviewer {
        address addr;
        string[] keywords;
    }

    struct Submission {
        address author;
        string data;
        mapping(address => bytes32) commits;
        mapping(address => bool) votes;
        mapping(address => bool) comments;
        address[] selectedReviewers;
        bool votingEnded;
        bool revealPhase;
        uint256 revealCount;
        bool isApproved;
    }

    address[] public authors;
    Reviewer[] public reviewers;
    Submission[] public submissions;
    string public LICENSE;
    uint256 public ROI_DENOMINATOR;

    address public owner;

    //constructor that sets license and ROI_DENOMINATOR
    constructor(string memory _license, uint256 _roiDenominator) {
        LICENSE = _license;
        ROI_DENOMINATOR = _roiDenominator;
        owner = msg.sender;
    }

    // Function to add an author, only callable by the owner
    function addAuthor(address _author) public {
        require(msg.sender == owner, "Only the owner can add authors.");
        authors.push(_author);
    }
}
