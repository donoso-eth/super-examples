import hre, { ethers } from "hardhat";
import { CloseStream__factory } from "../typechain-types/factories/src/CloseStream.sol/CloseStream__factory";
import { verifyContract } from "./verify";

async function main() {
    try {

        const closeStream = await new CloseStream__factory(deployer).deploy({ gasLimit: 10000000, nonce: nonce });

    } catch (err) {
        console.error(err);
    }
}

main()
    .then(() => process.exit(0))
    .catch(err => {
        console.error(err);
        process.exit(1);
    });
