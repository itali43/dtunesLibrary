require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",

  networks: {
    amoy: {
      chainId: 80002,
      url: "https://rpc-amoy.polygon.technology/",
      accounts:
        process.env.TESTNET_PRIVATE_KEY !== undefined
          ? [process.env.TESTNET_PRIVATE_KEY]
          : [],
      gas: 2100000,
    },
    polygon: {
      chainId: 137,
      url: process.env.MAINNET_POLYGON_URL || "",
      accounts:
        process.env.MAINNET_PRIVATE_KEY !== undefined
          ? [process.env.MAINNET_PRIVATE_KEY]
          : [],
    },
  },
};
