
const { ethers, upgrades, network } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  // Deploy NFT Token
  const NFTToken = await ethers.getContractFactory("nftToken");
  const nftToken = await NFTToken.deploy(50);

  await nftToken.deployed();

  console.log("NFT Token deployed to:", nftToken.address);

  // Deploy ERC20 Token
  const TokenAS = await ethers.getContractFactory("token");
  const tokenAS = await TokenAS.deploy(100000000000000);

  await tokenAS.deployed();

  console.log("ERC20 Token deployed to:", tokenAS.address);

  // Deploy Flight contract
  const Flight = await ethers.getContractFactory("TicketReservationSystem");
  const flight = await Flight.deploy(nftToken.address, tokenAS.address);

  await flight.deployed();

  console.log("Flight contract deployed to:", flight.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
