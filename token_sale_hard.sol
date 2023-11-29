// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenSale {
    uint256 private totalSupply;
    uint256 public checkTokenPrice;
    uint256 private immutable saleDuration;
    uint256 private immutable startTime;
    uint256 private immutable initialTotalSupply;
    mapping(address => uint256) private balances;
    mapping(address => uint256) private referralCounts;

    constructor(uint256 _totalSupply, uint256 _tokenPrice, uint256 _saleDuration) {
        totalSupply = _totalSupply;
        checkTokenPrice = _tokenPrice;
        saleDuration = _saleDuration;
        initialTotalSupply = _totalSupply;
        startTime = block.timestamp;
    }

    function purchaseToken(address referrer) external payable {
        require(referrer != msg.sender && balances[msg.sender] == 0 && block.timestamp <= startTime + saleDuration , "Invalid referrer");
        uint256 amount = msg.value / checkTokenPrice;
        require(amount <= totalSupply, "Not enough tokens left");

        uint256 referralReward = amount * (5 - referralCounts[referrer]) / 100;

        balances[msg.sender] += amount;
        totalSupply -= amount;
        balances[referrer] += referralReward;
        totalSupply -= referralReward;
        referralCounts[referrer]++;
        checkTokenPrice += checkTokenPrice * amount / (2 * initialTotalSupply);
    }

    function sellTokenBack(uint256 amount) external {
        balances[msg.sender] -= amount;
        totalSupply += amount;
        payable(msg.sender).transfer(amount * checkTokenPrice);
        checkTokenPrice -= checkTokenPrice * amount / initialTotalSupply;
    }

    function checkTokenBalance(address buyer) external view returns (uint256) {
        return balances[buyer];
    }

    function saleTimeLeft() external view returns (uint256) {
        return startTime + saleDuration - block.timestamp;
    }

    function getReferralCount(address referrer) external view returns (uint256) {
        return referralCounts[referrer];
    }

    function getReferralRewards(address referrer) external view returns (uint256) {
        return balances[referrer];
    }
}