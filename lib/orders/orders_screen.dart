import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/orderModel.dart';
import 'orderCard.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key, required this.title,});
  static String route() => '/order';
  final String title;

  final User? user = FirebaseAuth.instance.currentUser;
  final CollectionReference ordersCollection = FirebaseFirestore.instance.collection('orders');

  Future<void> deleteOrder(OrderModel order) async {
    try {
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(order.orderNumber) // use the ID of the order as the document ID
          .delete();
    } catch (error) {
      // handle any errors here
      print('Error deleting order: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          children: const [

            Text('Orders',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: ordersCollection
              .where('userId', isEqualTo: user?.uid)
              .orderBy('dateOfOrder', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final cartDocs = snapshot.data!.docs;
            final cartItems = cartDocs.map((doc) => OrderModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(cartItems[index].orderNumber.toString()),
                  onDismissed: (_) async {
                    await deleteOrder(cartItems[index]); // call deleteOrder with the corresponding OrderModel object
                  },
                  confirmDismiss: (_) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Delete Order'),
                          content: Text('Are you sure you want to delete this order?'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () => Navigator.of(context).pop(false),
                            ),
                            TextButton(
                              child: Text('Delete'),
                              onPressed: () => Navigator.of(context).pop(true),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: OrderCard(order: cartItems[index]),
                );


              },
            );
          },
        ),
      ),
    );
  }

}
