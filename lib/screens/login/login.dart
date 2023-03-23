import 'package:flutter/material.dart';
import 'package:heirrand/services/helper.dart';
import 'package:heirrand/widgets/bottom_nav.dart';
import '../../services/button.dart';
import '../../services/firebaseServices.dart';
import '../signup/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool isSigningIn = false;
  final FirebaseServices _firebaseServices = FirebaseServices();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                SizedBox(
                  height: getDeviceHeight(context),
                  width: getDeviceWidth(context),
                  child: Image.asset(
                    "assets/images/onboardImage.jpeg",
                    fit: BoxFit.fill,
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(height: 20.0),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset("assets/images/heirrandWhiteLogo.jpeg",
                                width: 80, height: 80),
                          ),
                          SizedBox(height: 20.0),
                          Center(
                            child: Text(
                              'Login To Your Account',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 50.0),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 25.0),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 50.0),
                          DefaultButton(
                            text: 'Login',
                            press: () async {
                              var validate = _formKey.currentState!.validate();
                              if (validate) {
                                isSigningIn = true;
                                setState(() {});
                                await _firebaseServices.signIn(
                                    context,
                                    _emailController.text,
                                    _passwordController.text);
                              } else {
                                //Fluttertoast.showToast(msg: 'error');
                                isSigningIn = false;
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavBar()),
                              );
                            },
                          ),
                          SizedBox(height: 30.0),
                          DefaultButton(
                            text: 'Register',
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
