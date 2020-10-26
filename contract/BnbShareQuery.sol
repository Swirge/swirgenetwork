pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

interface BnbShare {
    function count() external view returns (uint);
    function allShare(uint ShareID, uint ReplyID) external view returns (address,string memory,uint,bool,string memory);
}

interface BnbShareLike {
    function allLike(uint ShareID, uint ReplyID) external view returns (uint);
}

interface BnbShareReward {
    function getSum(uint ShareID, uint ReplyID) external view returns (uint);
}



contract BnbShareQuery {
    BnbShare ES = BnbShare(0x1C960FFb55E6558e4Ec0141296287804067932E6);
    BnbShareLike ESL = BnbShareLike(0xcC9A985C9119f613bD090a8FAfD6389216dA766E);
    BnbShareReward ESR = BnbShareReward(0xeAcDD3A236aBb88B591419356cFAb43C45d9AF81);
    
    struct oneQuery {
        address sender;
        string nickname;
        uint timestamp;
        bool AllowUpdated;
        string content;
        uint like;
        uint reward;
    }
    
    function get(uint ShareID, uint ReplyID) view public returns (oneQuery memory) {
        uint timestamp;
        address sender; 
        string memory nickname;
        string memory content;
        bool AllowUpdated;
        uint like;
        uint reward;
        
        (sender, nickname, timestamp, AllowUpdated, content) = ES.allShare(ShareID, ReplyID);
        like = ESL.allLike(ShareID, ReplyID);
        reward = ESR.getSum(ShareID, ReplyID);
        
        oneQuery memory answer = oneQuery(sender, nickname, timestamp, AllowUpdated, content, like, reward);
        
        return answer;
    }
}