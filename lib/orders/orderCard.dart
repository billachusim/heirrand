import 'package:flutter/material.dart';
import '../models/orderModel.dart';
import '../services/helper.dart';
import 'OrderDetailsPage.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the OrderDetailsPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderDetailsPage(orderNumber: order.orderNumber.toString(),)),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User Id: ${order.orderNumber}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),),
              Text('Order Number: ${order.userId}'),
              Text('Customer Name: ${order.customerName}'),
              Text('Customer Phone: ${order.customerPhone}'),
              Text('Pick Up Address: ${order.itemsDescription}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                ),),
              Text('Pick Up Address: ${order.pickUpAddress}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                ),),
              Text('Delivery Address: ${order.deliveryAddress}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                ),),
              Text('Number Of Items: ${order.numberOfItems}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                ),),
              Text('Pick Up Address: ${order.anyMoreInfo}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                ),),
              Text('Date Of Order: ${timeConverter(order.dateOfOrder!)}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                ),),
              Text('Status Of Order: ${order.statusOfOrder}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                ),),
              Text('Number Of Items: ${order.vehicleType}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                ),),
              Text('Total For Order: ${order.totalForOrder}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}


