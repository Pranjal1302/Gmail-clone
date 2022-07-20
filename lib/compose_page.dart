import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// String sender;

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();

}

class MyCustomFormState extends State<MyCustomForm> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Compose"),
          backgroundColor: Colors.grey.shade900,
          actions: [
            IconButton(
              icon: const Icon(Icons.attachment_outlined),
              onPressed: () => {},
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              onPressed: () => {},
            ),
            IconButton(
              icon: const Icon(Icons.wrap_text),
              onPressed: () => {},
            ),
          ],
          // leading:IconButton(onPressed: () =>{Navigator.pushNamed(context, '/main_page')} , icon: Icon(Icons.arrow_back)) ,

        ),
        body: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    prefixText: "  From   ",
                    prefixStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                    suffixIconColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0.0))),
                    fillColor: Colors.black87,
                    filled: true,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixText: "  To   ",
                    prefixStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0.0))),
                    fillColor: Colors.black87,
                    filled: true,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "  Subject",
                    hintStyle: TextStyle(color: Colors.white38),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0.0))),
                    fillColor: Colors.black87,
                    filled: true,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "  Compose Email",
                    hintStyle: TextStyle(color: Colors.white38),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0.0))),
                    fillColor: Colors.black87,
                    filled: true,
                  ),
                  style: const TextStyle(color: Colors.white),
                  maxLines: 29,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
