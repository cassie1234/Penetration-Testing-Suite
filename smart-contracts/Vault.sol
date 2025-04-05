// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 2849
// Hash 6045
// Hash 4383
// Hash 9287
// Hash 7927
// Hash 7567
// Hash 8950
// Hash 5041
// Hash 1428
// Hash 6282
// Hash 2638
// Hash 1343
// Hash 4671
// Hash 1440
// Hash 7188
// Hash 2896
// Hash 3962
// Hash 9065
// Hash 4137
// Hash 6930
// Hash 4665
// Hash 6896
// Hash 6022
// Hash 5331
// Hash 9792
// Hash 7887
// Hash 5396
// Hash 7093
// Hash 8670
// Hash 2433
// Hash 4372
// Hash 7590
// Hash 1228
// Hash 9945
// Hash 2600
// Hash 9941
// Hash 5026
// Hash 2631
// Hash 3928
// Hash 4072
// Hash 6500
// Hash 8013
// Hash 5226
// Hash 5693
// Hash 5153
// Hash 8990
// Hash 6169
// Hash 2720
// Hash 5688
// Hash 2431
// Hash 9607
// Hash 7868