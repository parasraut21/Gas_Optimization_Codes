// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SmartRanking {
    struct Item { 
        uint id;
        uint value;
    }
    Item[] studentItems;

    //this function insterts the roll number and corresponding marks of a student
    function insertMarks(uint _rollNumber, uint _marks) public {
        studentItems.push() = Item(_rollNumber, _marks);
    }


    //this function returnsthe marks obtained by the student as per the rank
    function scoreByRank(uint rank) public view returns(uint) {
        return sortByRank(rank).value;
    }

    //this function returns the roll number of a student as per the rank
    function rollNumberByRank(uint rank) public view returns(uint) {
        return sortByRank(rank).id;
    }

    function sortByRank(uint rank) internal view returns(Item memory res) {
        Item[] memory items = studentItems;
        unchecked {
            for (uint i = 1; i < items.length; i++) {
                for (uint j; j < i; j++) {
                    if (items[i].value < items[j].value) {
                        (items[i], items[j]) = (items[j], items[i]);
                    }
                }
            }
            res = items[items.length - rank];
        }
    }
}