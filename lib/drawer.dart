import 'package:flutter/material.dart';
import 'viewArticleByCategory.dart';
import 'package:get/get.dart';
import 'package:switcher_button/switcher_button.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                () => ViewArticleByCategory("Teknoloji", "Teknoloji"),
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
                () => ViewArticleByCategory("Sante", "Sante"),
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
                () => ViewArticleByCategory("Edikasyon", "Edikasyon"),
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
                () => ViewArticleByCategory("Spò", "Spo"),
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
                () => ViewArticleByCategory("Divètisman", "Divetisman"),
              );
            },
          ),
          ListTile(
            leading: Image.asset(
              "images/all.png",
              height: 30,
            ),
            title: Text("Jeneral"),
            onTap: () {
              Get.to(
                () => ViewArticleByCategory("Jeneral", "Jeneral"),
              );
            },
          ),
          Text(
            "\t Dark Mode",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // ListTile(
          //   leading: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SwitcherButton(
          //         value: false,
          //         offColor: Colors.blueGrey,
          //         onColor: Colors.black,
          //         onChange: (value){
          //           print(value);
          //         },
          //       ),
          //       Row(children: [
          //         Text("Off"), SizedBox(width: 20,), Text("On"),
          //       ],)
          //     ],
          //   ),
          //   title: Text(""),
          //
          // ),
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
          // ListTile(
          //   leading: loggedInUser != null
          //       ? Image.asset(
          //           "images/logout.png",
          //           height: 30,
          //         )
          //       : Image.asset(
          //           "images/login.png",
          //           height: 30,
          //         ),
          //   title: loggedInUser != null ? Text("Log out") : Text("Login"),
          //   onTap: () {
          //     if (loggedInUser != null) {
          //       _auth.signOut();
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Home()),
          //       );
          //     } else {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Login()),
          //       );
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
