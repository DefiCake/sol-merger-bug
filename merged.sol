pragma solidity ^0.5.0;


contract A {
    uint private a;

    function setA(uint _a) public {
        a = _a;
    }

    function getA() public view returns (uint) {
        return a;
    }
}

contract ConflictingInheritance {
    function thisContractWillNotBeCorrectlyMerged() public pure {
        require(false, "Because it will have they keyword contract in this string");
    }

}

contract Example is A, B, ConflictingInheritance {}