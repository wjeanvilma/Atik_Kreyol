import 'package:flutter/material.dart';
import 'drawer.dart';
import 'viewArticleByCategory.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

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
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Box(
                          "Teknoloji",
                          "images/computer.png",
                          Colors.red,
                          () => ViewArticleByCategory("Teknoloji", "Teknoloji"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Box(
                          "Sante",
                          "images/health.png",
                          Colors.blue,
                          () => ViewArticleByCategory("Sante", "Sante"),
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
                      child: Box(
                        "Edikasyon",
                        "images/education.png",
                        Colors.yellow,
                        () => ViewArticleByCategory("Edikasyon", "Edikasyon"),
                      ),
                    ),
                    Expanded(
                      child: Box(
                          "Spò",
                          "images/sport.png",
                          Colors.pink,
                          () => ViewArticleByCategory(
                              "Spò", "Spo")),
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
                      child: Box(
                        "Divètisman",
                        "images/laugh.png",
                        Colors.blueGrey.shade500,
                        () => ViewArticleByCategory("Divètisman", "Divetisman"),
                      ),
                    ),
                    Expanded(
                      child: Box(
                        "Jeneral",
                        "images/all.png",
                        Colors.amber.shade900,
                        () => ViewArticleByCategory("Jeneral", "Jeneral"),
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
                      child: Box(
                        "Pataje l",
                        "images/share.png",
                        Colors.purple,
                        () => ViewArticleByCategory("Jeneral", "Jeneral"),
                      ),
                    ),
                    Expanded(
                      child: Box(
                        "Evalye nou",
                        "images/rate.png",
                        Colors.teal,
                        () => ViewArticleByCategory("Jeneral", "Jeneral"),
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

  Widget Box(String pageName, String image, Color color, Function goToPage) {
    return GestureDetector(
      onTap: () {
        Get.to(goToPage());
      },
      child: Container(
        color: color,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              image,
              height: 70,
            ),
            Text(
              pageName,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
