async function main() {
  const [owner, randoPerson] = await ethers.getSigners();
  const pollContractFactory = await hre.ethers.getContractFactory("Poll");
  const pollContract = await pollContractFactory.deploy();
  await pollContract.deployed();
  console.log("Contract deployed to: ", pollContract.address);
  console.log("Contract deployed by: ", owner.address);

  let activeQuestion;
  activeQuestion = await pollContract.getActiveQuestion();

  let voteTxn = await pollContract.vote(0);
  await voteTxn.wait();

  voteTxn = await pollContract.vote(1);
  await voteTxn.wait();

  voteTxn = await pollContract.connect(randoPerson).vote(1);
  await voteTxn.wait();

  activeQuestion = await pollContract.getActiveQuestion();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });