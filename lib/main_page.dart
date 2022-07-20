import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main_app/compose_page.dart';

import 'mailcontent.dart';
import 'mailgenerator.dart';

var drawerIcons = [
  const Icon(
    Icons.move_to_inbox,
    color: Colors.white,
  ),
  const Icon(
    Icons.inbox,
    color: Colors.white,
  ),
  const Icon(
    Icons.people,
    color: Colors.white,
  ),
  const Icon(
    Icons.local_offer,
    color: Colors.white,
  ),
  const Icon(
    Icons.star,
    color: Colors.white,
  ),
  const Icon(
    Icons.access_time,
    color: Colors.white,
  ),
  const Icon(
    Icons.label,
    color: Colors.white,
  ),
  const Icon(
    Icons.send,
    color: Colors.white,
  ),
  const Icon(
    Icons.send,
    color: Colors.white,
  ),
  const Icon(
    Icons.note,
    color: Colors.white,
  ),
  const Icon(
    Icons.mail,
    color: Colors.white,
  ),
  const Icon(
    Icons.error,
    color: Colors.white,
  ),
  const Icon(
    Icons.delete,
    color: Colors.white,
  ),
  const Icon(
    Icons.assignment_turned_in_rounded,
    color: Colors.white,
  ),
  const Icon(
    Icons.label,
    color: Colors.white,
  ),
  const Icon(
    Icons.settings,
    color: Colors.white,
  ),
  const Icon(
    Icons.help,
    color: Colors.white,
  ),
];

var drawerText = [
  "All inboxes",
  "Primary",
  "Social",
  "Promotions",
  "Starred",
  "Snoozed",
  "Important",
  "Sent",
  "Outbox",
  "Drafts",
  "All mail",
  "Spam",
  "Bin",
  "Sent",
  "Trash",
  "Settings",
  "Help & feedback"
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
// Scaffold is a layout for
// the major Material Components.
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text("Gmail"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/signout');
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: ListView.builder(
              padding: const EdgeInsets.only(top: 25.0),
              itemCount: drawerText.length,
              itemBuilder: (context, position) {
                return ListTile(
                  leading: drawerIcons[position],
                  title: Text(drawerText[position],
                      style:
                          const TextStyle(fontSize: 15.0, color: Colors.white)),
                );
              }),
        ),
      ),
      body: _mailListViewGenerator(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        backgroundColor: Colors.grey.shade800,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.email_outlined),
            label: "Email",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_outline),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera_front),
            label: "Meet",
          )
        ],
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, '/compose_page');
            },
            backgroundColor: Colors.red,
            icon: const Icon(Icons.add),
            label: const Text("Compose"),
          );
        },
      ),
    );
  }

  Widget _mailListViewGenerator() => ListView.builder(
        itemCount: MailGenerator.mailList.length,
        itemBuilder: (context, position) {
          MailContent mailContent = MailGenerator.getMailContent(position);
          return Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 14.0, right: 14.0, top: 5.0, bottom: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.account_circle,
                    size: 55.0,
                    color: Colors.red,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                mailContent.sender,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 17.0),
                              ),
                              Text(
                                mailContent.time,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 13.5),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    mailContent.subject,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 15.5),
                                  ),
                                  Text(
                                    mailContent.message,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 15.5),
                                  )
                                ],
                              ),
                              const Icon(
                                Icons.star_border,
                                size: 25.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
          ]);
        });
}
