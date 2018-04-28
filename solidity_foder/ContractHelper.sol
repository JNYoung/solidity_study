pragma solidity ^0.4.21;

contract ContractHelper {
    mapping (address => bool) internal admins;
    mapping (address => bool) internal owners;
    mapping (address => uint) internal balances;
    function ContractHelper(){

    }

    modifier onlyontractOwner(address _senderAddress){
        require(owners[_senderAddress]);
        _;
    }

    modifier only_contract_admins(address _senderAddress){
        require(admins[_senderAddress]);
        _;
    }

    modifier onlyUserBalanceGreater(address _senderAddress, uint _amount) {
        require(balances[_senderAddress] > _amount);
        _;
    }


}
