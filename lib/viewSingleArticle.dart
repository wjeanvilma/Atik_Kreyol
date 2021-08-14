import 'package:atik_kreyol/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewSingleArticle extends StatefulWidget {
  final String database;
  final DocumentSnapshot document;

  ViewSingleArticle({required this.database, required this.document});

  @override
  _ViewSingleArticleState createState() => _ViewSingleArticleState();
}

var userID = FirebaseAuth.instance.currentUser;

late bool isLiked;
late int likeCount;
late var currentDocument;
late Map likes;

class _ViewSingleArticleState extends State<ViewSingleArticle> {
  @override
  Widget build(BuildContext context) {
    userID == null ? isLiked = false :
    isLiked = (widget.document['likes'][userID!.uid]) == true;
    likeCount = widget.document['likes'].length;

    FirebaseFirestore.instance
        .collection(widget.database)
        .doc(widget.document.id.toString())
        .update({'views': widget.document['views'] + 1});

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        brightness: Brightness.dark,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Stack(children: [
        SafeArea(
          child: Container(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.document['title'].toString(),
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "by: " + widget.document['author'],
                        style: TextStyle(
                            color: Colors.blueGrey, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.document['date'],
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.network(
                  widget.document['imageUrl'],
                ),
                Material(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                    child: Row(
                      children: [
                        Icon(Icons.remove_red_eye_outlined,
                            color: Colors.grey, size: 12),
                        SizedBox(width: 3),
                        Text((widget.document['views'] + 1).toString()),
                        SizedBox(width: 10),
                        Icon(Icons.favorite, size: 12, color: Colors.grey),
                        SizedBox(width: 3),
                        Text(likeCount.toString()),
                        SizedBox(width: 10),
                        Icon(Icons.comment, size: 12, color: Colors.grey),
                        SizedBox(width: 3),
                        Container(
                          child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('comments')
                                  .where("commentID",
                                      isEqualTo: widget.document.id)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                } else {
                                  return Text(
                                      snapshot.data!.docs.length.toString());
                                }
                                return Text('');
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    widget.document['text'].toString().replaceAll("\\n", "\n\n"),
                    style: GoogleFonts.getFont(
                      'Open Sans',
                      fontSize: 16,
                  ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            color: Colors.blueGrey.shade900,
            width: double.infinity,
            child: IconButton(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
        ),
      ]),
    );
  }
}
