// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract FinalProject_Marketplace {

    address payable public owner;

    enum ShippingStatus {PENDING, SHIPPED, DELIVERED}
    ShippingStatus status;

    event IsDelivered();
    event IsShipped();

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        owner = payable(msg.sender);
        status = ShippingStatus.PENDING;
    }

    function shipped() public onlyOwner {
        status = ShippingStatus.SHIPPED;
        emit IsShipped();

    }

    function delivered() public onlyOwner {
        status = ShippingStatus.DELIVERED;
        emit IsDelivered();
    }

    function getStatus() public view onlyOwner returns (ShippingStatus) {
        return status;
    }

    function Status() public payable returns (ShippingStatus) {
        return status;
    }
}
