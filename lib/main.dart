// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main_app/google_sign_in.dart';
import 'package:main_app/main_page.dart';
import 'package:main_app/compose_page.dart';
import 'package:main_app/login.dart';
import 'package:main_app/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:main_app/signout.dart';

Future<void> main() async => {
  WidgetsFlutterBinding.ensureInitialized(),
  await Firebase.initializeApp(),
  runApp(const MyApp()),
};

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(create: (context) => GooglesignInProvider(),
      child : MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  login(),
        routes: {
          './login':(context) => login(),
          '/compose_page': (context) => MyCustomForm(),
          '/main_page': (context) => const Home(),
          '/signup':(context) => const signup(),
          '/signout':(context) => const logout(),
        }
        )
  );

  }
