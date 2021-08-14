import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'signIn.dart';

class Comment extends StatefulWidget {
  final String commentID;

  Comment(this.commentID);

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final DateFormat formatter = DateFormat('MMM d, yyyy h:mm a');
  String comment = "";
  var commentFieldController = TextEditingController();

  late User loggedInUser;
  var userInfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  getUserInfo() async {
    loggedInUser = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Stack(
            children: [

              Align(
                alignment: Alignment.topRight,
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('comments')
                          .where("commentID", isEqualTo: widget.commentID)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return const Text("Loading...");

                        return ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) =>
                              buildListItem(context, snapshot.data!.docs[index]),
                        );
                      }),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: Platform.isIOS ? 80 : 50,
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 0,
                          bottom: Platform.isIOS ? 20 : 2),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: TextField(
                                controller: commentFieldController,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                minLines: 1,
                                maxLines: 2,
                                style: TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusColor: Colors.teal,
                                    hintText: "Type your message here..."),
                                onChanged: (value) {

                                  comment = value;
                                },
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                border: Border.all(
                                    width: 0.5, color: Colors.black54),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: IconButton(
                                  icon: Icon(Icons.send),
                                  color: Colors.blue,
                                  onPressed: () {
                                    // print(comment);
                                    // print(widget.commentID);
                                    makeComment();
                                    commentFieldController.clear();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListItem(BuildContext context, DocumentSnapshot document) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(Icons.arrow_right, size: 15,),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              elevation: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        document['email'],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade900),
                      ),
                      Text(
                          formatter.format(
                            DateTime.parse(document['date']),
                          ),
                          style: TextStyle(color: Colors.grey, fontSize: 11),),
                      SizedBox(height: 4),
                      Text(document['comment'], style: TextStyle(fontSize: 15))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  makeComment() {
    if ( FirebaseAuth.instance.currentUser != null){
      if (comment.trim() != "") {
        Map<String, String> data = <String, String>{
          'comment': comment,
          'email': FirebaseAuth.instance.currentUser!.email.toString(),
          'date': DateTime.now().toString(),
          'commentID': widget.commentID,
        };
        FirebaseFirestore.instance.collection('comments').add(data);
        comment = "";
      }
    } else {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: 2000),
          backgroundColor: Colors.white,
          content: Text(
            "Please log in",
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
          action: SnackBarAction(
              label: 'Login', onPressed: (){

            Get.offAll(SignIn());
          }),
        ),
      );
    }
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
