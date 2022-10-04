pragma solidity 0.8.17;

    contract ZombieFactory {
      uint dnaDigit = 16;
      uint dnaModulus = 10 ** dnaDigit;
      event NewZombie(uint zombieId, string name, uint dna);

      struct Zombie {
        string name;
        uint dna;
      }

      Zombie[] public zombies;

      function _createZombie(string memory _name, uint _dna) private {
          uint id = zombies.push(Zombie(_name, _dna)) - 1;
          emit NewZombie(id, _name, _dna);
      }

      function _generateRandDna(string memory _str) private returns (uint) {
        uint rand = keccak256(abi.encodePacked(_str));
        return rand % dnaModulus;
      }

      function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
      }
    }
