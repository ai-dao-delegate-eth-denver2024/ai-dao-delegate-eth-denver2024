pragma solidity ^0.8.0;

import "ds-test/test.sol";
import "../contracts/PeerReview.sol";

contract PeerReviewTest is DSTest {
    ReviewProcess reviewProcess;
    string expectedLicense = "Test License";
    uint256 expectedRoiDenominator = 1000;

    function setUp() public {
        reviewProcess = new ReviewProcess(expectedLicense, expectedRoiDenominator);
    }

    function testInitialLicenseSetting() public {
        assertEq(reviewProcess.LICENSE(), expectedLicense);
    }
    function testAddAuthor() public {
        address expectedAuthor1 = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8; // Anvil's local test account 1
        address expectedAuthor2 = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC; // Anvil's local test account 2

        reviewProcess.addAuthor(expectedAuthor1);
        reviewProcess.addAuthor(expectedAuthor2);

        assertEq(reviewProcess.authors(0), expectedAuthor1);
        assertEq(reviewProcess.authors(1), expectedAuthor2);
    }
