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

    // Function to add a reviewer, only callable by the owner
    function addReviewer(address _reviewer, string[] memory _keywords) public {
        require(msg.sender == owner, "Only the owner can add reviewers.");
        reviewers.push(Reviewer(_reviewer, _keywords));
    }

    // Function to get a reviewer's information by index
    function getReviewer(uint256 index)
        public
        view
        returns (address, string[] memory)
    {
        Reviewer storage reviewer = reviewers[index];
        return (reviewer.addr, reviewer.keywords);
    }

    // Function to add a keyword to a reviewer
    function addKeywordToReviewer(uint256 reviewerIndex, string memory keyword)
        public
    {
        require(msg.sender == owner, "Only the owner can add keywords.");
        require(reviewerIndex < reviewers.length, "Reviewer does not exist.");
        reviewers[reviewerIndex].keywords.push(keyword);
    }

    // Submit a data object
    function submitData(string memory _data) public returns (uint256) {
        Submission storage newSubmission = submissions.push();
        newSubmission.author = msg.sender;
        newSubmission.data = _data;
        uint256 submissionId = submissions.length - 1;
        emit SubmissionCreated(submissionId);
        return submissionId;
    }

    event SubmissionCreated(uint256 submissionId);

    // Function to get a submission's data by its ID
    function getSubmission(uint256 submissionId) public view returns (address author, string memory data) {
        require(submissionId < submissions.length, "Submission does not exist.");
        Submission storage submission = submissions[submissionId];
        return (submission.author, submission.data);
    }
}
