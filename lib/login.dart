import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 35, top: MediaQuery.of(context).size.height * 0.20),
              child: const Text(
                'Login Here',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.32,
                    right: 35,
                    left: 35),
                child: Expanded(
                  child: Column(children: [
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
                    Row(
                      children: [
                        const SizedBox(width: 45),
                        TextButton(
                            onPressed: () {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email, password: password)
                                  .then((FirebaseUser) {
                                Navigator.pushNamed(context, '/main_page');
                              }).catchError((e) {
                                print(e);
                              });
                            },
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            )),
                        const SizedBox(width: 25),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            )),
                      ],
                    )
                  ]),
                )),
            // Container(
            //   child: TextButton(
            //       onPressed: () {
            //         FirebaseAuth.instance
            //             .signInWithEmailAndPassword(
            //                 email: email, password: password)
            //             .then((FirebaseUser) {
            //           Navigator.pushNamed(context, '/main_page');
            //         }).catchError((e) {
            //           print(e);
            //         });
            //       },
            //       child: const Text("Sign in",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),)),
            // ),
            //   const SizedBox(height: 10),
            //   Container(
            //     child: TextButton(
            //         onPressed: () {
            //           Navigator.pushNamed(context, '/signup');
            //         },
            //         child: const Text("Sign Up")),
            //   )
          ],
        ),
      ),
    );
  }
}
