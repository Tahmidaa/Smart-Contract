pragma solidity ^0.8.0;
contract Project
{
    struct Donatee{

        string name;
        string message;
        address donateeAddress;
       
    }


    // Restrict functions to only valid donatee account user
    modifier OnlyDonatee {
        require(
            donatee == msg.sender,
            "You are not allowed to perform this action"
        );
        _; 
    }

    
    
    Donatee[] public donateeList;
    
    //The needy people would upload their data on the portal connected to the Blockchain system

    function _donateeDetails (string memory name, string memory message ) public OnlyDonatee{
         Donatee memory z;
            z.name= name;
            z.message= message;
            z.donateeAddress = msg.sender;
            donateeList.push(z);
            
            
    }
     
    //The community can access their data from the Blockchain and would be able to help them directly and safely

    function getListOfDonatees() public view returns (Donatee[] memory) {
        return donateeList;
    }
    


    uint256 public threshold;
    uint256 max;
    address[] accounts; 
      address donatee;
      address donor;
      address charitableorg;


 struct CharitableOrg{
        address charitableAddress;
    }  
    
// Restrict functions to only valid charitable organization account user
    modifier OnlyCharitableOrg{
        require(
            charitableorg == msg.sender,
            "You are not allowed to perform this action"
        );
        _; 
    }

    
    struct Donor{
        address donorAddress;
    }
    
    // Restrict functions to only valid donor account user
    modifier OnlyDonor {
        require(
            donor == msg.sender,
            "You are not allowed to perform this action"
        );
        _;
    } 
    

    uint256 private balance;

    // set threshold 
    function setThreshold(uint256 _threshold) public OnlyCharitableOrg{
        threshold = _threshold;
    }

    // Emitted when the donation amount > threshold
    event AboveTheThreshold(
        string message,
        address donorAddress,
        uint256 amount
        );
    
    function donate(uint256 amount) public payable OnlyDonor{
             if (msg.value > 0) {
                  if (msg.value > threshold){
          // emitted when a donation amount > threshold
            emit AboveTheThreshold(
                "Your donation amount is above the threshold! ",//message
                msg.sender, //account address
                msg.value //amount
            );
        } else (balance += msg.value);
             }
            
    } 
           
// Defining a constructor   
     constructor() public{   
        max = 50 ether;
        threshold = 10 ether;

    }

     

    }


