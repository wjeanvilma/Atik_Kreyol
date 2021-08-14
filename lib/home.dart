import 'signIn.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'viewArticleByCategory.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

bool isInSync = false;

class _State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Icon(
                  Icons.create,
                  size: 35,
                  //color: Colors.red,
                ),
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
            )
          ],
          title: Text("Atik Kreyòl"),
          backgroundColor: Colors.blueGrey[900],
        ),
        drawer: Drawer(
          child: MyDrawer(),
        ),
        body: ModalProgressHUD(
          inAsyncCall: isInSync,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: box(
                            "Teknoloji",
                            "images/computer.png",
                            Colors.red,
                            () =>
                                ViewArticleByCategory("Teknoloji", "teknoloji"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: box(
                            "Sante",
                            "images/health.png",
                            Colors.blue,
                            () => ViewArticleByCategory("Sante", "sante"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: box(
                          "Edikasyon",
                          "images/education.png",
                          Colors.yellow,
                          () => ViewArticleByCategory("Edikasyon", "edikasyon"),
                        ),
                      ),
                      Expanded(
                        child: box(
                          "Spò",
                          "images/sport.png",
                          Colors.pink,
                          () => ViewArticleByCategory("Spò", "spo"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: box(
                          "Divètisman",
                          "images/laugh.png",
                          Colors.blueGrey.shade500,
                          () =>
                              ViewArticleByCategory("Divètisman", "divetisman"),
                        ),
                      ),
                      Expanded(
                        child: box(
                          "Politik",
                          "images/all.png",
                          Colors.amber.shade900,
                          () => ViewArticleByCategory("Politik", "politik"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: box(
                          "Pataje l",
                          "images/share.png",
                          Colors.purple,
                          () => ViewArticleByCategory("Jeneral", "jeneral"),
                        ),
                      ),
                      Expanded(
                        child: box(
                          "Evalye nou",
                          "images/rate.png",
                          Colors.teal,
                          () => ViewArticleByCategory("Jeneral", "jeneral"),
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
    );
  }

  Widget box(String pageName, String image, Color color, Function goToPage) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isInSync = true;
        });
        Future.delayed(Duration(seconds: 1), () {
          Get.to(goToPage());
          setState(() {
            isInSync = false;
          });
        });
      },
      child: Container(
        color: color,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              image,
              height: 50,
            ),
            SizedBox(height: 5),
            Text(
              pageName,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
