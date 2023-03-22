import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderDetailsPage extends StatelessWidget {
  final String orderNumber;
  const OrderDetailsPage({Key? key, required this.orderNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('orders').doc(orderNumber).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final orderData = snapshot.data!.data() as Map<String, dynamic>;
          final orderItems = orderData['items'] as List<dynamic>;

          return ListView.builder(
            itemCount: orderItems.length,
            itemBuilder: (context, index) {
              final itemData = orderItems[index] as Map<String, dynamic>;
              final productData = itemData['product'] as Map<String, dynamic>;
              final productName = productData['name'] as String;
              final productPrice = productData['price'] as double;
              final productImage = productData['image'] as String;
              final quantity = itemData['quantity'] ?? 3;

              return ListTile(
                leading: Image.asset(productImage),
                title: Text(productName),
                subtitle: Text('Price: $productPrice, \n Quantity: $quantity'),
                trailing: Text('Total: ${productPrice * quantity}'),
              );
            },
          );
        },
      ),
    );
  }
}
