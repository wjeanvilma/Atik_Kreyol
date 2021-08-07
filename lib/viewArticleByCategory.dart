import 'package:flutter/material.dart';

class ViewArticleByCategory extends StatefulWidget {
  final String title, database;
  ViewArticleByCategory(this.title, this.database);

  @override
  _ViewArticleByCategoryState createState() => _ViewArticleByCategoryState();
}

class _ViewArticleByCategoryState extends State<ViewArticleByCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
            child: Column(
              children: [
                Container(
                  color: Colors.blueGrey.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "document['title']",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "by: " + "document['author']",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "document['date']",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.network(
                        "https://media-exp1.licdn.com/dms/image/C4D16AQFmwU4LobdIBg/profile-displaybackgroundimage-shrink_200_800/0/1622030465973?e=1633564800&v=beta&t=6yW1ShZjdCAJWReaC2sH6lTu-yeSWzCZ8FaxQJw29UM",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                              .substring(0, 100),
                      ),
                      Text(
                        "Read more",
                        style: TextStyle(color: Colors.blue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.blueGrey.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "document['title']",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "by: " + "document['author']",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "document['date']",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.network(
                        "https://media-exp1.licdn.com/dms/image/C4D16AQFmwU4LobdIBg/profile-displaybackgroundimage-shrink_200_800/0/1622030465973?e=1633564800&v=beta&t=6yW1ShZjdCAJWReaC2sH6lTu-yeSWzCZ8FaxQJw29UM",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.blueGrey.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "document['title']",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "by: " + "document['author']",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "document['date']",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.network(
                        "https://media-exp1.licdn.com/dms/image/C4D16AQFmwU4LobdIBg/profile-displaybackgroundimage-shrink_200_800/0/1622030465973?e=1633564800&v=beta&t=6yW1ShZjdCAJWReaC2sH6lTu-yeSWzCZ8FaxQJw29UM",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.blueGrey.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "document['title']",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "by: " + "document['author']",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "document['date']",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.network(
                        "https://media-exp1.licdn.com/dms/image/C4D16AQFmwU4LobdIBg/profile-displaybackgroundimage-shrink_200_800/0/1622030465973?e=1633564800&v=beta&t=6yW1ShZjdCAJWReaC2sH6lTu-yeSWzCZ8FaxQJw29UM",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
