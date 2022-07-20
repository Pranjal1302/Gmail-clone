import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth_buttons/auth_buttons.dart';

class logout extends StatefulWidget {
  const logout({Key? key}) : super(key: key);

  @override
  _logoutState createState() => _logoutState();
}

class _logoutState extends State<logout> {
  final _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  late String cemail = user.email!;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text("Google"),
      ),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                left: 14.0, right: 14.0, top: 5.0, bottom: 5.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget>[
                  const Icon(
                    Icons.account_circle,
                    size: 55.0,
                    color: Colors.red,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10.0),
                      child: Text(
                        '' + cemail,
                        style: const TextStyle(fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 17.0),
                      ))
                ]),
          ),
          Container(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.39, top: 60),
            child: TextButton(
                child: const Text('Logout',style: TextStyle(
    fontSize: 25, fontWeight: FontWeight.w500),),
                onPressed: () {
                  FirebaseAuth.instance
                      .signOut()
                      .then((value) => {
                            Navigator.popUntil(
                                context, ModalRoute.withName("/"))
                          })
                      .catchError((e) {
                    print(e);
                  });
                }),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}
