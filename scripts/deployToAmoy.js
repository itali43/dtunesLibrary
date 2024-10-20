// scripts/deployToMumbai.js
// npx hardhat run --network mumbai scripts/deployToAmoy.js
// DEPLOYS DTunesLibrary.sol TO MUMBAI TESTNET!

import { ethers, upgrades } from "hardhat";
import dotenv from "dotenv";

dotenv.config();

async function main() {
  const CharacterContract = await ethers.getContractFactory("DTunesLibrary");
  console.log("Deploying DTunesLibrary to Testnet...");
  // using compromised address for testnet so priv key can be shared
  const { address: deployedAddress } = await upgrades.deployProxy(
    CharacterContract,
    [process.env.OWNER_PUBLIC_ADDR],
    {
      initializer: "initialize",
    }
  );
  console.log("DTunesLibrary deployed to:", deployedAddress);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
