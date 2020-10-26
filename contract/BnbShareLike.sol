pragma solidity ^0.4.13;

// Record the thumbs up for EtherShare
contract BnbShareLike {

    address public link = 0x1C960FFb55E6558e4Ec0141296287804067932E6;  

    mapping(uint => mapping(uint => uint)) public allLike;

    function like(uint ShareID, uint ReplyID) public {
        allLike[ShareID][ReplyID]++;
    }
}