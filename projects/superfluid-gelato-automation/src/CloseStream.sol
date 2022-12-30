// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {OpsReady} from './gelato/OpsReady.sol';
import {CFAv1Library} from "@superfluid-finance/ethereum-contracts/contracts/apps/CFAv1Library.sol";
import {ISuperfluid,ISuperToken} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol";
import {IConstantFlowAgreementV1} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/agreements/IConstantFlowAgreementV1.sol";


contract CloseStream is OpsReady {
    using CFAv1Library for CFAv1Library.InitData;
    CFAv1Library.InitData public _cfaLib;
    ISuperfluid public host; // host
    IConstantFlowAgreementV1 public cfa; // the stored constant flow agreement class address
    ISuperToken superToken;


    constructor(address _ops) OpsReady(_ops, address(this)){
    
    cfa = IConstantFlowAgreementV1(address(host.getAgreementClass(keccak256("org.superfluid-finance.agreements.ConstantFlowAgreement.v1"))));
      
    _cfaLib = CFAv1Library.InitData(host, cfa);
    }


    function createCloseStreamTask(address receiver, uint256 duration) external {

    }


    function closeStream() external onlyOps {

    }

    modifier onlyOps() {
        require(msg.sender == address(ops), "OpsReady: onlyOps");
        _;
    }
  
}