pragma solidity ^0.4.21;
import "./SafeMath.sol";
import "./token/ECR20.sol";
import "./token/ERC20Basic.sol";


/**
一个老虎机的智能合约
*/
contract SlotMachine is ERC20{
    using SafeMath for uint256;
    //管理员，生成合约的人
    address private owner;
    event Win(address indexed winnerAddress, uint winAmount);//胜利
    event Loss(address indexed loserAddress, uint lossAmount);//失败
    event inCharge(address indexed inchargeAddress, uint inchargeAmount, bool isSucc);//充值
    event widthDraw(address indexed withDrawAddress, uint widthdrawAmount, bool isSucc);//提现
    uint private gambleInPoolThreshold;//入场的花费账户。

    //每个账户的账户余额
    mapping (address => uint) private balance;

    function SlotMachine(){
        owner[msg.sender] = true;
        admins[msg.sender] = true;
        owner = msg.sender;
    }

    function totalSupply() public view returns (uint256){
        return 200000000;
    }

    function balanceOf(address who) public view returns (uint256){
        require(who != address(0));
        return balances(who);
    }

    function transfer(address to, uint256 value) public returns (bool){
        require(msg.sender.balance > value);
        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[to] = balances[from].add(value);
        Transfer(msg.sender, to, value);
    }

    function allowance(address owner, address spender) public view returns (uint256){
        return getMin(balances[owner], balances[spender]);
    }

    function getMin(uint a, uint b) returns (uint){
        if(a<b){
            return a;
        } else {
            return b;
        }
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool){
        balances[from] = balances[from].sub(value);
        balances[to] = balances[from].add(value);
        Transfer(from, to, value);

    }

    function approve(address spender, uint256 value) public returns (bool){
       Approval(owner, spender, value);
    }

    function name() public view returns (string){
        return "Slot machine";
    }

    function inCharge(uint amount)

    function roll() public external {
        require(balance[msg.sender] > gambleInPoolThreshold);//有钱才能玩
        bool iswin;
        uint rollResult;
        (iswin, rollResult) = _roll();
        if(iswin) {
            uint winPrce = _calculateMutiple(rollResult).mul(gambleInPoolThreshold);
            balance[owner] = balance[owner].sub(gambleInPoolThreshold);
            balance[msg.sender] = balance[msg.sender].add(gambleInPoolThreshold);
            emit Win(msg.sender, winPrce);
        } else {
            balance[owner] = balance[owner].add(gambleInPoolThreshold);
            balance[msg.sender] = balance[msg.sender].sub(gambleInPoolThreshold);
            emit Loss(address indexed loserAddress, uint lossAmount);//失败

        }
    }

    function _roll() private onlyUserBalanceGreater(msg.sender) onlyBalanceAfford() returns (bool, uint) {

    }

    function _calculateMutiple(uint input) private pure returns (uint){
        uint multiple = 1;
        return multiple;
    }


    function caculateSeudoRandom(address _rollerAddress) private onlyUserBalanceGreater(_rollerAddress) returns (uint){
        uint result = 888888;
        return result;
    }
}