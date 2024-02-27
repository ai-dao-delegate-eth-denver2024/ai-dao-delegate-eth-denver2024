import { expect } from "chai";
import hre from "hardhat";

import { waitForBlock } from "../../utils/block";

export function shouldBehaveLikePeerReview(): void {
  it("shouldHaveTestLicense", async function () {
    const license = await this.peerReview.LICENSE();
    expect(license === "Test License")
  })

  // it("should add amount to the peerReview and verify the result", async function () {
  //   const amountToCount = 10;

  //   const eAmountCount = this.instance.instance.encrypt32(amountToCount);
  //   await this.peerReview.connect(this.signers.admin).add(eAmountCount);

  //   await waitForBlock(hre);

  //   const eAmount = await this.peerReview.connect(this.signers.admin).getPeerReview(this.instance.publicKey);
  //   const amount = this.instance.instance.decrypt(await this.peerReview.getAddress(), eAmount);

  //   expect(amount === amountToCount);
  // });
}
