import axios from "axios";
import { ethers } from "hardhat";
import hre from "hardhat";

import type { PeerReview } from "../../types";
import { waitForBlock } from "../../utils/block";

export async function deployPeerReviewFixture(): Promise<{ peerReview: PeerReview; address: string }> {
  const signers = await ethers.getSigners();
  const admin = signers[0];

  const peerReviewFactory = await ethers.getContractFactory("PeerReview");


  const peerReview = await peerReviewFactory.connect(admin).deploy("Test License", 1000);
  const address = await peerReview.getAddress();
  return { peerReview, address };
}

export async function getTokensFromFaucet() {
  if (hre.network.name === "localfhenix") {
    const signers = await hre.ethers.getSigners();

    if ((await hre.ethers.provider.getBalance(signers[0].address)).toString() === "0") {
      console.log("Balance for signer is 0 - getting tokens from faucet");
      await axios.get(`http://localhost:6000/faucet?address=${signers[0].address}`);
      await waitForBlock(hre);
    }
  }
}
