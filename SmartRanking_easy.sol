
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SmartRanking {
    mapping(uint=>uint) student ;
    uint maxMarks = 0 ;
    uint maxRoll ;
    //this function is used to insert the marks
    function insertMarks(uint _rollNumber, uint _marks) public {
        student[_rollNumber] =  _marks ;
        if(_marks > maxMarks) {
            maxMarks = _marks ;
            maxRoll = _rollNumber ;
            }
    }

    //this function returns the hightest marks obtained by student
   function topperMarks() public view returns (uint) {
    require(maxMarks != 0);
    return maxMarks;
}

// This function returns the roll number of the student having the highest marks
function topperRollNumber() public  view returns (uint) {
    require(maxRoll != 0);
    return maxRoll;
}

}