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
}
