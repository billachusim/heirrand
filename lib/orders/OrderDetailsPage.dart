import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heirrand/orders/orderCard.dart';

import '../models/orderModel.dart';
import '../services/helper.dart';

class OrderDetailsPage extends StatelessWidget {
  final String orderNumber;

  const OrderDetailsPage({super.key, required this.orderNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('orders').doc(orderNumber).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          OrderModel order = OrderModel.fromJson(snapshot.data!.data() as Map<String, dynamic>);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order Number: ${order.orderNumber}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),),
                        SizedBox(height: 16,),
                        Text('Customer Name: ${order.customerName}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),),
                        SizedBox(height: 16,),
                        Text('Customer Phone: ${order.customerPhone}'),
                        SizedBox(height: 16,),
                        Text('Items Description: ${order.itemsDescription}',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),),
                        SizedBox(height: 16,),
                        Text('Pick Up Address: ${order.pickUpAddress}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 16,),
                        Text('Delivery Address: ${order.deliveryAddress}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),),
                        SizedBox(height: 16,),
                        Text('Number Of Items: ${order.numberOfItems}',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),),
                        SizedBox(height: 16,),
                        Text('Any More Info: ${order.anyMoreInfo}',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),),
                        SizedBox(height: 16,),
                        Text('Date Of Order: ${timeConverter(order.dateOfOrder!)}',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),),
                        SizedBox(height: 16,),
                        Text('Status Of Order: ${order.statusOfOrder}',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),),
                        SizedBox(height: 16,),
                        Text('Vehicle Type: ${order.vehicleType}',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),),
                        SizedBox(height: 16,),
                        Text('Total For Order: ${order.totalForOrder}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16.0)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.yellow.shade800,
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Handle Pay Order button pressed
                        },
                        child: Text(
                          'Pay Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16.0)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green.shade700,
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Handle Track Order button pressed
                        },
                        child: Text(
                          'Track Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
