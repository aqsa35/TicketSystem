require("dotenv").config(); // Import the dotenv package

require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-ethers");


const privateKey = process.env.PRIVATE_KEY; // Retrieve the private key from the .env file
const etherscanAPIKey = process.env.API_KEY; // Retrieve the Etherscan API key from the .env file
const URL = process.env.URL;

module.exports = {
  solidity: {
    version: "0.8.20",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  networks: {
    testnet: {
      url: URL,
      accounts: [privateKey],
    },
    mainnet: {
      url: "https://sepolia.infura.io/v3/ticket",
      accounts: [privateKey],
    },
  },
  etherscan: {
    apiKey: etherscanAPIKey,
  },
  paths: {
    sources: "./contracts",
    tests: "./tests",
    cache: "./cache",
    artifacts: "./artifacts",
  },
  mocha: {
    timeout: 9000000000, // Increased timeout for tests if needed
  },
};