// contract ShipmentService {
//     address immutable owner;  
    
//     struct Custom{
//         mapping(uint=>uint) pins;
//         uint completedDeliveries;
//     }
//     constructor() {
//         owner = msg.sender;
//     }

//     mapping(address => Custom) private pinsaddrs;
//     uint private shipped;

//     //This function inititates the shipment
//     function shipWithPin(address customerAddress, uint pin) public {
//         require(msg.sender == owner);
//          require(customerAddress != owner);
//         require(pin >= 1000 && pin <= 9999);
     
//         pinsaddrs[customerAddress].pins[pin] = 1;
//         ++shipped;
//     }

//     //This function acknowlegdes the acceptance of the delivery
//     function acceptOrder(uint pin) public {
//         Custom storage customer = pinsaddrs[msg.sender];
//         require(customer.pins[pin] == 1);
//         // pins[msg.sender][pin] = 0;
//         ++customer.completedDeliveries;
//         // --shipped[msg.sender];
//         --shipped;
//     }

//     //This function outputs the status of the delivery
//     function checkStatus(address customerAddress) public view returns (uint){
//           require(msg.sender == owner || msg.sender == customerAddress);
//         // return shipped[customerAddress];
//            return shipped;
//     }

//     //This function outputs the total number of successful deliveries
//     function totalCompletedDeliveries(address customerAddress) public view returns (uint) {
//         require(msg.sender == owner || msg.sender == customerAddress);
//         return pinsaddrs[customerAddress].completedDeliveries;
//     }
// }