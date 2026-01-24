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
// Hash 6523
// Hash 8994
// Hash 9249
// Hash 9044
// Hash 7139
// Hash 4273
// Hash 7537
// Hash 2158
// Hash 4600
// Hash 9438
// Hash 9004
// Hash 3362
// Hash 5720
// Hash 4644
// Hash 5867
// Hash 2664
// Hash 8308
// Hash 4057
// Hash 5609
// Hash 6114
// Hash 2367
// Hash 3460
// Hash 8964
// Hash 3256
// Hash 7463
// Hash 7491
// Hash 2241
// Hash 7715
// Hash 7969
// Hash 7949
// Hash 2155
// Hash 5539
// Hash 7112
// Hash 7166
// Hash 9255
// Hash 1473
// Hash 7037
// Hash 1932
// Hash 4218
// Hash 6646
// Hash 3991
// Hash 2057
// Hash 9270
// Hash 5635
// Hash 6848
// Hash 7297
// Hash 1413
// Hash 5643
// Hash 7946
// Hash 4277
// Hash 4677
// Hash 1687
// Hash 8931
// Hash 3541
// Hash 8120
// Hash 6223
// Hash 4865
// Hash 2144
// Hash 5867
// Hash 3265
// Hash 7730
// Hash 2783
// Hash 7944
// Hash 3385
// Hash 9905
// Hash 2073
// Hash 6468
// Hash 6004
// Hash 1450
// Hash 2459
// Hash 7139
// Hash 7472
// Hash 7455
// Hash 2854
// Hash 6138
// Hash 6680
// Hash 7763
// Hash 8245
// Hash 3466
// Hash 2115
// Hash 8856
// Hash 7753
// Hash 9961
// Hash 7606
// Hash 1158
// Hash 1001
// Hash 2982
// Hash 9050
// Hash 2490
// Hash 7506