import 'package:atik_kreyol/home.dart';
import 'package:atik_kreyol/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'viewArticleByCategory.dart';
import 'package:get/get.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:firebase_core/firebase_core.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var _auth = FirebaseAuth.instance;

  var loggedInUser;

  bool isInSync = false;

  @override
  Widget build(BuildContext context) {
    loggedInUser = _auth.currentUser;
    return ModalProgressHUD(
      inAsyncCall: isInSync,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.blueGrey.shade900,
          brightness: Brightness.dark,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                child: UserAccountsDrawerHeader(
                  accountName: Text("Atik Kreyòl"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/star.png'),
                    backgroundColor: Colors.white,
                  ),
                  decoration: BoxDecoration(color: Colors.blueGrey[900]),
                  accountEmail: Text("atikkreyol@gmail.com"),
                ),
              ),
              Text(
                "\tKategori",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Image.asset(
                  "images/computer.png",
                  height: 30,
                ),
                title: Text("Teknoloji"),
                onTap: () {
                  Get.to(
                    () => ViewArticleByCategory("Teknoloji", "teknoloji"),
                  );
                },
              ),
              ListTile(
                leading: Image.asset(
                  "images/health.png",
                  height: 30,
                ),
                title: Text("Sante"),
                onTap: () {
                  Get.to(
                    () => ViewArticleByCategory("Sante", "sante"),
                  );
                },
              ),
              ListTile(
                leading: Image.asset(
                  "images/education.png",
                  height: 30,
                ),
                title: Text("Edikasyon"),
                onTap: () {
                  Get.to(
                    () => ViewArticleByCategory("Edikasyon", "edikasyon"),
                  );
                },
              ),
              ListTile(
                leading: Image.asset(
                  "images/sport.png",
                  height: 30,
                ),
                title: Text("Spò"),
                onTap: () {
                  Get.to(
                    () => ViewArticleByCategory("Spò", "spo"),
                  );
                },
              ),
              ListTile(
                leading: Image.asset(
                  "images/laugh.png",
                  height: 30,
                ),
                title: Text("Divètisman"),
                onTap: () {
                  Get.to(
                    () => ViewArticleByCategory("Divètisman", "divetisman"),
                  );
                },
              ),
              ListTile(
                leading: Image.asset(
                  "images/all.png",
                  height: 30,
                ),
                title: Text("Politik"),
                onTap: () {
                  Get.to(
                    () => ViewArticleByCategory("Politik", "politik"),
                  );
                },
              ),
              Text(
                "\tAccount",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Container(
                  height: 30,
                  child: Icon(
                    Icons.create,
                  ),
                ),
                title: Text("Publish an article"),
                onTap: () {
                  // if (loggedInUser != null) {
                  //   print(loggedInUser.email);
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Compose()),
                  //   );
                  // } else {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Login()),
                  //   );
                  // }
                },
              ),
              ListTile(
                leading: loggedInUser != null
                    ? Image.asset(
                        "images/logout.png",
                        height: 30,
                      )
                    : Image.asset(
                        "images/login.png",
                        height: 30,
                      ),
                title: loggedInUser != null ? Text("Log out") : Text("Login"),
                onTap: () {
                  setState(() {
                    isInSync = loggedInUser != null ? true :false;
                  });
                  Future.delayed(Duration(seconds: 1), () {
                    if (loggedInUser != null) {
                      _auth.signOut();
                    }
                    Get.offAll(SignIn());
                    setState(() {
                      isInSync = false;
                    });
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
