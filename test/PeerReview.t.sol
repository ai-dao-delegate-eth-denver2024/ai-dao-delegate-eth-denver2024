// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "ds-test/test.sol";
import "../contracts/PeerReview.sol";

contract PeerReviewTest is DSTest {
    PeerReview peerReview;
    string expectedLicense = "Test License";
    uint256 expectedRoiDenominator = 1000;

    function setUp() public {
        peerReview = new PeerReview(
            expectedLicense,
            expectedRoiDenominator
        );
    }

    function testInitialLicenseSetting() public {
        assertEq(peerReview.LICENSE(), expectedLicense);
    }

    function testAddAuthor() public {
        address expectedAuthor1 = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8; // Anvil's local test account 1
        address expectedAuthor2 = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC; // Anvil's local test account 2

        peerReview.addAuthor(expectedAuthor1);
        peerReview.addAuthor(expectedAuthor2);

        assertEq(peerReview.authors(0), expectedAuthor1);
        assertEq(peerReview.authors(1), expectedAuthor2);
    }

    function testAddReviewer() public {
        address[4] memory expectedReviewers = [
            0x90F79bf6EB2c4f870365E785982E1f101E93b906, // Anvil's local test account 3
            0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65, // Anvil's local test account 4
            0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc, // Anvil's local test account 5
            0x976EA74026E726554dB657fA54763abd0C3a0aa9 // Anvil's local test account 6
        ];
        string[][] memory keywords = new string[][](4);
        keywords[0] = new string[](1);
        keywords[0][0] = "gasless";
        keywords[1] = new string[](1);
        keywords[1][0] = "scalability";
        keywords[2] = new string[](1);
        keywords[2][0] = "security";
        keywords[3] = new string[](1);
        keywords[3][0] = "usability";

        for (uint256 i = 0; i < expectedReviewers.length; i++) {
            peerReview.addReviewer(expectedReviewers[i], keywords[i]);
            (address reviewerAddr, string[] memory reviewerKeywords) = peerReview.getReviewer(i);
            assertEq(reviewerAddr, expectedReviewers[i]);
            for (uint256 j = 0; j < keywords[i].length; j++) {
                assertEq(reviewerKeywords[j], keywords[i][j]);
            }
        }
    }
}
