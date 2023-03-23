import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heirrand/models/orderModel.dart';
import 'package:heirrand/orders/orderCard.dart';
import 'package:heirrand/screens/order_pickup_form.dart';
import '../services/helper.dart';
import '../widgets/auto_scroll_container.dart';
import '../widgets/delivery_activity_widget.dart';
import 'login/login.dart';

class Homepage extends StatefulWidget {

  const Homepage({
    Key? key
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser;


  @override
  void initState() {
    super.initState();
  }



  @override
  void dispose() {
    super.dispose();
  }


  Stream<List<OrderModel>> getOrders(String userId) {
    return FirebaseFirestore.instance
        .collection('orders')
        .orderBy('dateOfOrder', descending: true)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
        .map((doc) => OrderModel.fromJson(doc.data()))
        .toList());
  }



  @override
  Widget build(BuildContext context) {

    return Material(
      child: WillPopScope(
        onWillPop: (){
          SystemNavigator.pop();
          return Future.value(false);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            elevation: 2,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/heirrandWhiteLogo.jpeg"),
            ),
            title: const Text("Heirrand"),
            actions: [
              IconButton(
                onPressed: () async {
                },
                icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: getDeviceHeight(context),
              width: getDeviceWidth(context),
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/images/onboardImage.jpeg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    children: [
                      AutoScrollContainer(),

                      SizedBox(height: 120,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if (currentUser == null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OrderPickUpForm()),
                                );
                              }
                            },
                            child: Container(
                              height: 60,
                              width: 270,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: LinearGradient(
                                      colors: const [
                                        Colors.green,
                                        Colors.lightGreenAccent,
                                      ]
                                  )
                              ),
                              child: Center(
                                child: Text(
                                  "Order PickUp 'n' Delivery",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 90,),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 16),
                          width: 140,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.lightGreenAccent,
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: Container(
                            height: 23,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 9.0),
                              child: Text(
                                "Delivering Now:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(6),
                        height: 240,
                        width: getDeviceWidth(context),
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: StreamBuilder<List<OrderModel>>(
                          stream: getOrders(currentUser!.uid),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return Center(
                                child: Text('No orders yet'),
                              );
                            }

                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final order = snapshot.data![index];
                                return DeliveryCard(order: order);
                              },
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}