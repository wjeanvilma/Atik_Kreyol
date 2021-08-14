import 'package:atik_kreyol/home.dart';
import 'package:atik_kreyol/signUp.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'customTextField.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'global.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

var email = TextEditingController();
var password = TextEditingController();
bool isInSync = false;

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var focusNode = FocusNode();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(focusNode);
        },
        child: ModalProgressHUD(
          color: Colors.blueGrey,
          inAsyncCall: isInSync,
          child: Container(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 70, bottom: 20, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome,",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            "Sign in to continue",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Column(
                        children: [
                          CustomTextField(
                              field: email,
                              obscureText: false,
                              hint: "Email",
                              icon: Icons.email),
                          SizedBox(height: 10),
                          CustomTextField(
                              field: password,
                              obscureText: true,
                              hint: "Password",
                              icon: Icons.vpn_key),
                          SizedBox(height: 10),
                          Container(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(fontSize: 15, color: Colors.red),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(focusNode);
                              signInUser();
                            },
                            child: Material(
                              elevation: 20,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Colors.red, Colors.purple]),
                                ),
                                width: double.infinity,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text("Or"),
                          SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              Get.to(Home());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Colors.red, Colors.purple])),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Continue as a guest",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(SignUp());
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  signInUser() {
    setState(() {
      isInSync = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      if (GetUtils.isEmail(email.text)) {
        if (password.text != "") {
          FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: email.text.trim(), password: password.text.trim())
              .then((ok) {
            Get.offAll(Home());
          }).catchError((error) {
            showSnackBar(
                message: error.toString().split('] ').last,
                duration: 2500,
                context: context,
                color: Colors.red);
          });
        } else {
          showSnackBar(
              message: "A password is required",
              duration: 1000,
              context: context,
              color: Colors.red);
        }
      } else {
        showSnackBar(
            message: "Invalid Email", duration: 1000, context: context, color: Colors.red);
      }
      setState(() {
        isInSync = false;
      });
    });
  }
}
