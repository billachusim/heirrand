import 'package:flutter/material.dart';
import '../models/orderModel.dart';
import '../services/helper.dart';

class DeliveryCard extends StatelessWidget {
  final OrderModel order;

  const DeliveryCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${order.pickUpAddress} to ${order.deliveryAddress}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            Text('${order.vehicleType}, ${timeConverter(order.dateOfOrder!)} | ${order.statusOfOrder}',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12.0,
              ),),
          ],
        ),
      ),
    );
  }
}


