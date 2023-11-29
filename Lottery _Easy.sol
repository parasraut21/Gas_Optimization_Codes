
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;
contract LotteryPool {

    uint256 members;
    address winner;
    mapping(uint => address) participants;
    
    // For participants to enter the pool
    function enter() public payable {
        require(msg.value == 0.1 ether);
        for(uint256 k = 0; k < members; k++){
            require(participants[k] != msg.sender);
        }
        participants[members] = msg.sender;
        members++;
        if(members == 5){
            winner =  participants[block.prevrandao % 5]; 
            payable(winner).transfer(address(this).balance);
            members = 0;
        }
    }

    // To view participants in current pool
    function viewParticipants() public view returns (address[] memory, uint) {
        address[] memory par = new address[](members);
        for(uint256 k = 0; k < members; k++){
            par[k] = participants[k];
        }
        return(par, members);
    }

    // To view winner of last lottery
    function viewPreviousWinner() public view returns (address) {
        return winner;
    }
}