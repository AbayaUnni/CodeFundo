pragma solidity >=0.4.25 <0.6.0;
contract election_conductor
{
   //Set of States
  enum StateType { voted, notVoted }
  //List of properties
  StateType public  State;
  address public  Voter;
  string public  candidate;
  string public voterId;
  // constructor function
  constructor(string memory message) public
  {
      Voter = msg.sender;
      voterId = message;
      State = StateType.notVoted;
  }
  // call this function to send a request
  function voteForACandidate(string memory requestMessage) public
  {
      if (Voter != msg.sender)
      {
          revert();
      }
      if(State == StateType.voted){
          revert();
      }
      candidate = requestMessage;
      State = StateType.voted;
  }
}