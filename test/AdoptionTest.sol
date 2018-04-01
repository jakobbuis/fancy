pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract AdoptionTest {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    function testAUserCanAdoptAPet() public {
        uint id = adoption.adopt(8);
        Assert.equal(8, id, "Adoption of pet ID 8 should be recorded");
    }

    function testGetter() public {
        Assert.equal(adoption.adopters(8), this, "Owner mismatch");
    }

    function testAnOwnerOfAnAdoptedPetAppearsInTheListOfAdoptions() public {
        address[16] memory adopters = adoption.getAdopters();
        Assert.equal(adopters[8], this, "Owner mismatch");
    }
}
