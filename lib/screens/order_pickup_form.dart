import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderPickUpForm extends StatefulWidget {

  const OrderPickUpForm({Key? key,
  }) : super(key: key);

  @override
  _OrderPickUpFormState createState() => _OrderPickUpFormState();
}

class _OrderPickUpFormState extends State<OrderPickUpForm> {
  final TextEditingController _customerName = TextEditingController();
  final TextEditingController _customerPhone = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _deliveryAddress = TextEditingController();
  final TextEditingController _pickUpAddress = TextEditingController();
  final TextEditingController _anyMoreInfo = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String _orderNumber;


  @override
  void dispose() {
    _customerName.dispose();
    _customerPhone.dispose();
    _pickUpAddress.dispose();
    _description.dispose();
    _deliveryAddress.dispose();
    _anyMoreInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        centerTitle: true,
        title: Text("PickUp 'n' Delivery Form",
            textAlign: TextAlign.start,
            maxLines: 1,
            style: GoogleFonts.lato(
                fontSize: 26.0,
                color: Colors.amber,
                fontWeight: FontWeight.w600)),
      ),
      body: SafeArea(
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [

                    Container(
                      color: Colors.grey.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text('Complete Your Order',
                              //textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  fontSize: 23.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Your Name";
                                  }
                                },
                                textInputAction: TextInputAction.next,
                                controller: _customerName,
                                decoration:  const InputDecoration(
                                  hintText: 'Mr Chike Uba',
                                  labelText: "Your Name Please",
                                  labelStyle:
                                  TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey)),
                                  contentPadding:
                                  EdgeInsets.only(right: 15, left: 15),
                                ),
                                keyboardType: TextInputType.text,
                                style: GoogleFonts.lato(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.white,
                            child: TextFormField(
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Phone Number";
                                  }
                                },
                                textInputAction: TextInputAction.next,
                                controller: _customerPhone,
                                decoration: const InputDecoration(
                                  hintText: "+2348068597140",
                                  labelText: "Phone Number",
                                  labelStyle:
                                  TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey)),
                                  contentPadding: EdgeInsets.only(right: 15, left: 15),
                                ),
                                keyboardType: TextInputType.number,
                                style: GoogleFonts.lato(
                                    fontSize: 12.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Container(
                            color: Colors.white,
                            child: TextFormField(
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please describe item";
                                  }
                                },
                                textInputAction: TextInputAction.next,
                                controller: _description,
                                decoration: const InputDecoration(
                                  hintText: "One laptop and one document.",
                                  labelText: "Please describe the items(s)",
                                  labelStyle:
                                  TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey)),
                                  contentPadding:
                                  EdgeInsets.only(right: 15, left: 15),
                                ),
                                keyboardType: TextInputType.text,
                                style: GoogleFonts.lato(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          Container(
                            color: Colors.white,
                            child: TextFormField(
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Complete Pick Up Address";
                                  }
                                },
                                textInputAction: TextInputAction.next,
                                controller: _pickUpAddress,
                                decoration: const InputDecoration(
                                  hintText: "No. 1 St Peter's Road, Off Old Onitsha Road, Abubor, Nnewichi, Nnewi.",
                                  labelText: "Full Pick Up Address",
                                  labelStyle:
                                  TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey)),
                                  contentPadding:
                                  EdgeInsets.only(right: 15, left: 15),
                                ),
                                keyboardType: TextInputType.text,
                                style: GoogleFonts.lato(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          Container(
                            color: Colors.white,
                            child: TextFormField(
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Complete Delivery Address";
                                  }
                                },
                                textInputAction: TextInputAction.next,
                                controller: _deliveryAddress,
                                decoration: const InputDecoration(
                                  hintText: "No. 29, Awka Road, Off Old Onitsha Road, Abubor, Ekwulobia.",
                                  labelText: "Full Delivery Address",
                                  labelStyle:
                                  TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey)),
                                  contentPadding:
                                  EdgeInsets.only(right: 15, left: 15),
                                ),
                                keyboardType: TextInputType.text,
                                style: GoogleFonts.lato(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          Container(
                            color: Colors.white,
                            child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: _anyMoreInfo,
                                decoration: const InputDecoration(
                                  hintText: "I will like you guys to do this and do that...",
                                  labelText: "Any More Info?",
                                  labelStyle:
                                  TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.amber)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey)),
                                  contentPadding:
                                  EdgeInsets.only(right: 15, left: 15),
                                ),
                                keyboardType: TextInputType.text,
                                style: GoogleFonts.lato(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      color: Colors.grey.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text('Choose a method below to confirm your order, start a conversation with us and track your oder.',
                              //textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    GestureDetector(
                      onTap: () async {
                        await sendOrderToFirestore();
                        //onContinueToWhatsAppClicked();
                        Get.offNamed('/order');
                      },
                      child: Container(
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.add_card, color:Colors.white, size:30),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 75.0),
                                    child: Text("Pay Now",
                                        //textAlign: TextAlign.center,
                                        style: GoogleFonts.lato(
                                            fontSize: 22.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 75.0),
                                    child: Text("Secure checkout by Paystack.",
                                        //textAlign: TextAlign.center,
                                        style: GoogleFonts.lato(
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8,),
                    GestureDetector(
                      onTap: () async {
                        await sendOrderToFirestore();
                        onContinueToWhatsAppClicked();
                        Get.offNamed('/order');
                      },
                      child: Container(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              const Icon(Icons.payments_rounded, color:Colors.white, size:30),
                              Padding(
                                padding: const EdgeInsets.only(right: 75.0),
                                child: Text("Pay On Delivery",
                                    //textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                        fontSize: 22.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  String? getWhatsAppUrl(String payload ){
    return "https://api.whatsapp.com/send?phone=2348068597140&text=" + (payload);
  }

  onContinueToWhatsAppClicked() {
    var whatsAppUrl = getWhatsAppUrl(getPayload() ?? "");
    launch(whatsAppUrl!);

  }


  launchEmailApp() {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');

    }

    final String payload = getPayload().toString();
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'nnewitech@gmail.com',
      query: encodeQueryParameters(
          <String, String>{
            'subject': 'Please Confirm My Order For PickUp And Delivery',
            'body': payload,
          }),
    );

    launchUrl(emailLaunchUri);
  }

  String? getPayload(){
    final currentUser = FirebaseAuth.instance.currentUser;
    var userId = currentUser?.uid;
    var orderNumber = _orderNumber;
    var customerName = _customerName.text.isEmpty ? "null" : _customerName.text;
    var customerPhone = _customerPhone.text.isEmpty ? "null" : _customerPhone.text;
    var description = _description.text.isEmpty ? "null" : _description.text;
    var pickUpAddress = _pickUpAddress.text.isEmpty ? "null" : _pickUpAddress.text;
    var deliveryAddress = _deliveryAddress.text.isEmpty ? "null" : _deliveryAddress.text;
    var anyMoreInfo = _anyMoreInfo.text.isEmpty ? "null" : _anyMoreInfo.text;



    return """
      Hello, Nkwo Nnewi Market Admin,
      I'm ready to confirm my order. These are my details.:

      My User Id Is: $userId
      
      My Order Id Is: $orderNumber
            
      My Name Is: $customerName
      
      My Phone Number Is: $customerPhone
      
      The Description Is: $description
      
      My Pick Up Address Is: $pickUpAddress
      
      My Delivery Address Is: $deliveryAddress

      More Info For This Order Is: $anyMoreInfo

    """.trim();
  }



  Future<void> sendOrderToFirestore() async {
    final CollectionReference ordersCollection = FirebaseFirestore.instance.collection('orders');
    final currentUser = FirebaseAuth.instance.currentUser;
    var customerName = _customerName.text.isEmpty ? "null" : _customerName.text;
    var customerPhone = _customerPhone.text.isEmpty ? "null" : _customerPhone.text;
    var description = _description.text.isEmpty ? "null" : _description.text;
    var pickUpAddress = _pickUpAddress.text.isEmpty ? "null" : _pickUpAddress.text;
    var deliveryAddress = _deliveryAddress.text.isEmpty ? "null" : _deliveryAddress.text;
    var anyMoreInfo = _anyMoreInfo.text.isEmpty ? "null" : _anyMoreInfo.text;
    // Generate a unique order number
    final orderNumber = '${Timestamp.now().millisecondsSinceEpoch}-${currentUser?.uid}';
    // Save the order number to shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('orderNumber', orderNumber);
    _orderNumber = orderNumber;


    try {
      await ordersCollection.doc(orderNumber).set({
        'orderNumber': orderNumber,
        'userId': currentUser?.uid,
        'dateOfOrder': FieldValue.serverTimestamp(),
        'customerName': customerName,
        'customerPhone': customerPhone,
        'itemsDescription': description,
        'pickUpAddress': pickUpAddress,
        'deliveryAddress': deliveryAddress,
        'anyMoreInfo': anyMoreInfo,
        'statusOfOrder': 'pending',
        'vehicleType': 'Heirrand Super Bike',
        'totalForOrder': 'pending',
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

}