import { task } from "hardhat/config";
import type { TaskArguments } from "hardhat/types";

task("task:deployPeerReview").setAction(async function (taskArguments: TaskArguments, { ethers }) {
  const signers = await ethers.getSigners();
  const peerReviewFactory = await ethers.getContractFactory("PeerReview");
  const peerReview = await peerReviewFactory.connect(signers[0]).deploy();
  // await peerReview.waitForDeployment();
  console.log("PeerReview deployed to: ", await peerReview.getAddress());
});
