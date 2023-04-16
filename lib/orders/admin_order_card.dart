import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/orderModel.dart';
import '../services/firebaseServices.dart';
import '../services/helper.dart';
import 'OrderDetailsPage.dart';

class AdminOrderCard extends StatefulWidget {
  final OrderModel order;

  const AdminOrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<AdminOrderCard> createState() => _AdminOrderCardState();
}

class _AdminOrderCardState extends State<AdminOrderCard> {
  bool? isFeatured;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the OrderDetailsPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderDetailsPage(orderNumber: widget.order.orderNumber.toString(),)),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order Number: ${widget.order.orderNumber}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),),
              Text('User Id: ${widget.order.userId}'),
              Text('Customer Name: ${widget.order.customerName}'),
              Text('Customer Phone: ${widget.order.customerPhone}'),
              Text('Items Description: ${widget.order.itemsDescription}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13.0,
                ),),
              Text('Pick Up Address: ${widget.order.pickUpAddress}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              Text('Delivery Address: ${widget.order.deliveryAddress}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),),
              Text('Number Of Items: ${widget.order.numberOfItems}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13.0,
                ),),
              Text('Any More Info: ${widget.order.anyMoreInfo}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13.0,
                ),),
              Text('Date Of Order: ${timeConverter(widget.order.dateOfOrder!)}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13.0,
                ),),
              Text('Status Of Order: ${widget.order.statusOfOrder}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13.0,
                ),),
              Text('Vehicle Type: ${widget.order.vehicleType}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13.0,
                ),),
              Text('is Featured? ${widget.order.isFeatured}',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 13.0,
                ),),
              Text('Total For Order: ${widget.order.totalForOrder}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                ),),
              GestureDetector(
                onTap: () {
                  if (widget.order.isFeatured == false)
                    setState(() {
                      setToFeatured(widget.order);
                    });
                  else removeFromFeatured(widget.order);
                  setState(() {});
                },
                child: Container(
                  child: Icon(
                    widget.order.isFeatured == true ? Icons.lightbulb : Icons.lightbulb_outline,
                    color: Colors.green,
                    size: 26,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  /// Edit feature

  Future<bool?> setToFeatured(OrderModel order) async {
    final String orderNumber = order.orderNumber.toString();
    final value = true;
    FirebaseFirestore.instance
        .collection('orders')
        .doc(orderNumber)
        .update({
      "isFeatured": value,
    },
    );
    logger.d('Successfully changed feature');
    print('Is Featured?: $value');
    isFeatured = value;
    return value;
  }


  Future<bool?> removeFromFeatured(OrderModel order) async {
    final String orderNumber = order.orderNumber.toString();
    final value = false;
    FirebaseFirestore.instance
        .collection('orders')
        .doc(orderNumber)
        .update({
      "isFeatured": value,
    },
    );
    logger.d('Successfully changed feature');
    print('Is Featured?: $value');
    isFeatured = value;
    return value;
  }

}


