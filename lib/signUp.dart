import 'package:atik_kreyol/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'customTextField.dart';
import 'package:get/get.dart';
import 'global.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

var email = TextEditingController();
var password = TextEditingController();
var confirmPassword = TextEditingController();
bool isInSync = false;

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var focusNode = FocusNode();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(focusNode);
        },
        child: ModalProgressHUD(
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
                            "Sign up to continue",
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
                          CustomTextField(
                              field: confirmPassword,
                              obscureText: true,
                              hint: "Confirm Password",
                              icon: Icons.vpn_key),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).requestFocus(focusNode);
                              signUpUser();
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
                                    "Sign Up",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                            "Already have an account? ",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(SignIn());
                            },
                            child: Text(
                              "Login",
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

  signUpUser() {
    setState(() {
      isInSync = true;
    });

    Future.delayed(new Duration(seconds: 1), () {
      if (GetUtils.isEmail(email.text)) {
        if (password.text != "") {
          if (password.text == confirmPassword.text) {
            FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: email.text, password: password.text)
                .then((ok) {
              showSnackBar(
                  duration: 2000,
                  message: "Account successfully created",
                  context: context,
                  color: Colors.green);
              Get.offAll(SignIn());
            }).catchError((error) {
              showSnackBar(
                  duration: 2000,
                  message: error.toString().split('] ').last,
                  context: context,
                  color: Colors.red);
            });
          } else {
            showSnackBar(
                duration: 1000,
                message: "Passwords do not match",
                context: context,
                color: Colors.red);
          }
        } else {
          showSnackBar(
              duration: 1000,
              message: "A password is required",
              context: context,
              color: Colors.red);
        }
      } else {
        showSnackBar(
            duration: 1000,
            message: "Invalid Email", context: context, color: Colors.red);
      }
      setState(() {
        isInSync = false;
      });
    });
  }
}
