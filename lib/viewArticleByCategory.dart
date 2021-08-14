import 'package:atik_kreyol/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'viewSingleArticle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:atik_kreyol/comment.dart';
import 'package:intl/intl.dart';

class ViewArticleByCategory extends StatefulWidget {
  final String title, database;
  ViewArticleByCategory(this.title, this.database);

  @override
  _ViewArticleByCategoryState createState() => _ViewArticleByCategoryState();
}

class _ViewArticleByCategoryState extends State<ViewArticleByCategory> {

  final DateFormat formatter = DateFormat('MMM d, yyyy h:mm a');

  late String userID;
  late bool isLiked;
  late int likeCount;
  late Map likes = {};
  var loggedInUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('${widget.database}')
              .orderBy("date", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text("Loading...");
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) =>
                  buildListItem(context, snapshot.data!.docs[index]),
            );
          }),
    );
  }

  Widget buildListItem(BuildContext context, DocumentSnapshot document) {

    loggedInUser != null ? userID = loggedInUser!.uid.toString() : userID = "";
    likes = document['likes'];
    loggedInUser != null ? isLiked = (document['likes'][loggedInUser!.uid]) == true : isLiked = false;

    likeCount = likes.length;

    handleLikePost() {
      if (loggedInUser != null){
        bool _isLiked = document['likes'][userID] == true;
        if (_isLiked) {
          FirebaseFirestore.instance
              .collection(widget.database)
              .doc(document.id)
              .update({'likes.$userID': FieldValue.delete()});
          setState(() {
            likeCount -= 1;
            isLiked = false;
            document['likes'][userID] = false;
          });
        }
        else if (!_isLiked) {
          FirebaseFirestore.instance
              .collection(widget.database)
              .doc(document.id)
              .update({'likes.$userID': true});
          setState(() {
            likeCount += 1;
            isLiked = true;
            document['likes'][userID] = true;
          });
        }
      } else {
        final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(
          SnackBar(
            duration: Duration(milliseconds: 1000),
            backgroundColor: Colors.white,
            content: Text(
              "Please log in",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            action: SnackBarAction(
                label: 'Login', onPressed: (){
                  // FocusScope.of(context).requestFocus(FocusNode());
                  Get.offAll(SignIn());
            }),
          ),
        );
      }


    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  document['title'],
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "by: " + document['author'],
                  style: TextStyle(
                      color: Colors.blueGrey, fontWeight: FontWeight.bold),
                ),
                Text( formatter.format(
                  DateTime.parse(document['date']),
                ),
                  style: TextStyle(color: Colors.blueGrey),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Image.network(
          document['imageUrl'],
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
            child: Row(
              children: [
                Icon(Icons.remove_red_eye_outlined, color: Colors.grey),
                SizedBox(width: 3),
                Text(document['views'].toString()),
                SizedBox(width: 10),
                GestureDetector(
                  child: isLiked ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite, color: Colors.grey),
                  onTap: () {
                    handleLikePost();
                  },
                ),
                SizedBox(width: 3),
                Text(likeCount.toString()),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: (){
                    Get.to(Comment(document.id.toString()));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.comment, color: Colors.blue),
                      SizedBox(width: 3),
                      Container(
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('comments')
                                .where("commentID", isEqualTo: document.id)
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
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              document['text'].toString().length > 100
                  ? Text(
                      document['text'].toString().substring(0, 100) +
                          "...",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  : Text(
                      document['text'].toString() + "...",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
              GestureDetector(
                onTap: () {
                  Get.to(
                    ViewSingleArticle(
                      database: widget.database,
                      document: document,
                    ),
                  );
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "Read more",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                height: 5,
              ),
            ],
          ),
        ),
        Container(
          height: 5,
          color: Colors.grey,
        ),
      ],
    );

  }

}
