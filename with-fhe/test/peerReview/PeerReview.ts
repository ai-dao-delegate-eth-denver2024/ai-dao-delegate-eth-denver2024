import { ethers } from "hardhat";
import hre from "hardhat";

import { waitForBlock } from "../../utils/block";
import { createFheInstance } from "../../utils/instance";
import type { Signers } from "../types";
import { shouldBehaveLikePeerReview } from "./PeerReview.behavior";
import { deployPeerReviewFixture, getTokensFromFaucetBySignedId } from "./PeerReview.fixture";

describe("Unit tests", function () {
  before(async function () {
    this.signers = {} as Signers;

    // get tokens from faucet if we're on localfhenix and don't have a balance
    await getTokensFromFaucetBySignedId();

    // deploy test contract
    const { peerReview, address } = await deployPeerReviewFixture();
    this.peerReview = peerReview;

    this.instance = await createFheInstance(hre, address);

    // set admin account/signer
    const signers = await ethers.getSigners();
    this.signers.admin = signers[0];

    // wait for deployment block to finish
    await waitForBlock(hre);
  });

  describe("PeerReview", function () {
    shouldBehaveLikePeerReview();
  });
});
