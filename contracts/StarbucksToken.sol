//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract StarbucksToken {
    string public name = "Starbucks Token";
    string public symbol = "SBUX";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000000 * 10 ** 18;
    address public owner;
    address public feeCollector;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowances;

    constructor() {
        owner = msg.sender;
        balances[msg.sender] = totalSupply;
        feeCollector = 0x8290ca240f25480a6C08d0150f07C5C41E6E5689;
    }

    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(amount <= balances[msg.sender], "Insufficient balance");

        uint256 fee = amount / 100; // Calculate 1% fee
        uint256 amountAfterFee = amount - fee;

        balances[msg.sender] -= amount;
        balances[recipient] += amountAfterFee;
        balances[feeCollector] += fee; // Transfer fee to fee collector contract

        emit Transfer(msg.sender, recipient, amountAfterFee);
        emit Transfer(msg.sender, owner, fee);

        return true;
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return allowances[owner][spender];
    }

    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        require(amount <= balances[sender], "Insufficient balance");
        require(amount <= allowances[sender][msg.sender], "Insufficient allowance");

        uint256 fee = amount / 100; // Calculate 1% fee
        uint256 amountAfterFee = amount - fee;

        balances[sender] -= amount;
        balances[recipient] += amountAfterFee;
        balances[owner] += fee; // Transfer fee to fee collector contract
        allowances[sender][msg.sender] -= amount;

        emit Transfer(sender, recipient, amountAfterFee);
        emit Transfer(sender, owner, fee);

        return true;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }
}