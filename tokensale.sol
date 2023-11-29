// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

contract TokenSale {
    uint256 private totalSupply;
    uint256 public immutable checkTokenPrice;
    uint256 private immutable saleDuration;
    uint256 private immutable startTime;
    mapping(address => uint256) private balances;
    uint256 private  sellBackCounts;

    error err();
    

    constructor(uint256 _totalSupply, uint256 _tokenPrice, uint256 _saleDuration) payable {
        totalSupply = _totalSupply;
        checkTokenPrice = _tokenPrice;
        saleDuration = _saleDuration;
        startTime = block.timestamp;
    }

    function purchaseToken() external payable  {
        uint256 amount = msg.value / checkTokenPrice;
        if (balances[msg.sender] != 0 ||block.timestamp > startTime + saleDuration|| amount > totalSupply) revert err();
    
        balances[msg.sender] += amount;
        totalSupply -= amount;
    }

    function sellTokenBack(uint256 amount) external {
        if (sellBackCounts >= 5) revert err();
        balances[msg.sender] -= amount;
        totalSupply += amount;
        sellBackCounts++;
        payable(msg.sender).transfer(amount * checkTokenPrice);
    }

    function checkTokenBalance(address buyer) external view returns (uint256) {
        return balances[buyer];
    }

    function saleTimeLeft() external view returns (uint256) {
        return startTime + saleDuration - block.timestamp;
    }
}