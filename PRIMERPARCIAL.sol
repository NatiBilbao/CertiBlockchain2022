// SPDX-License-Identifier: GLP-3.0

pragma solidity ^0.8.0;

contract TestD {
    address private owner;
    bool private closed = false;
    event mensajeDeCompra(string message);

    struct Registro {
        uint id;
        string name;
        uint tickets;
        bool enable;
        uint tipo;
    }

    mapping(uint => Registro) public listRegistro;

    constructor(){
        owner=msg.sender;
    }

    function createRegistro(Registro memory registroData) public onlyOwner(msg.sender) closedRegistro {
        require(bytes(registroData.name).length > 7, "El nombre del cliente debe tener una longitud mayor a 7");
        listRegistro[registroData.id] = Registro(registroData.id, registroData.name, 0, true,0);
    }

    function compraBoletos(uint tipo, uint tickets) public payable closedRegistro{
        require(listRegistro[id].tickets == 0, "Cliente bronce");
        listRegistro[id].tipo = 1;
        listRegistro.[id].tickets = 10;
        listRegistro.[id].enable = false;

        if(listRegistro[id].tickets > 10){
        emit messageEvente(listRegistro[id].name, "Compra no permitida")
        }
    }

    function closeOrOpenBoleteria(bool value) public onlyOwner(msg.sender){
        closed = value;
    }

    modifier onlyOwner(address wallet){
        require(owner == wallet, "Tu no eres el owner");
        _;
    }

    modifier closeBoleteria(){
        require(!closed,"La boleteria ya esta cerrada");
    }

    function convertWeiToEther(uint amountInWei) private pure returns(uint){
        return amountInWei / 1 ether;
    }
}
