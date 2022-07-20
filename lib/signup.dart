import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main_app/google_sign_in.dart';
import 'package:provider/provider.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final _firestore = FirebaseFirestore.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,

      ),
      body: SingleChildScrollView(
        child: Stack(
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 35, top: 80),
                child: const Text(
                  'Register Here',
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        hintText: "  Email",
                        hintStyle: TextStyle(color: Colors.white38),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0.0))),
                        fillColor: Colors.black87,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: "  Password",
                        hintStyle: TextStyle(color: Colors.white38),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0.0))),
                        fillColor: Colors.black87,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                        onPressed: () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email, password: password)
                              .then((signedInUser) {
                            _firestore.collection('users').add({
                              'email': email,
                              'pass': password,
                            }).then((value) {
                              (Navigator.pushNamed(context, '/main_page'));
                            }).catchError((e) {
                              print(e);
                            });
                          }).catchError((e) {
                            print(e);
                          });
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        )),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            minimumSize: const Size(350, 45)),
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          final provider = Provider.of<GooglesignInProvider>(
                              context,
                              listen: false);
                          provider.googleLogin();
                        },
                        label: const Text('Sign Up with google'))
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
