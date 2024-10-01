// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract studentPortal {
    address owner;

   
    struct studentDetail {
        string name;
        string email;
        uint dob;
        string lga;
        string country;
        string state;
    }

    
    studentDetail[] students;

    function createPortal(
        string memory _name,
        string memory _email,
        uint _dob,
        string memory _lga,
        string memory _country,
        string memory _state
    ) public {
        students.push(studentDetail(_name, _email, _dob, _lga, _country, _state));
    }

    
    function updateStudent(
        uint256 _index,
        string memory _name,
        string memory _email,
        uint _dob,
        string memory _lga,
        string memory _country,
        string memory _state
    ) public {
        
        require(msg.sender == owner, "You're not eligible for this");

        
        require(_index < students.length, "Student index out of bounds");

        
        students[_index] = studentDetail(_name, _email, _dob, _lga, _country, _state);
    }

    
    constructor() {
        owner = msg.sender;
    }

    function deleteStudent(uint256 _index) external {
        require(msg.sender == owner, "You're not eligible to do this");
        (_index < students.length, "student index out of bound");
        students[_index] = students[students.length - 1];
        students.pop();
    }
        
}
