// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:mail_client/src/screens/compose.dart';
import 'package:mail_client/src/screens/mail_list.dart';
import 'package:mail_client/src/services/send.dart';
import 'package:mail_client/src/models/user.dart';

// basic layout of how the inbox screen with fetched mails looks like
class Inbox extends StatefulWidget {
  List<Mail> emails;
  Inbox({super.key, required this.emails});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(// sidebar for various options such as logout, inbox , sent, etc
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Text(
                'Mail Client',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 231, 43, 29),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter-Bold',
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 30, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.inbox_sharp,
                      size: 25,
                    ),
                    SizedBox(width: 22),
                    Text(
                      'Inbox',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter-Bold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 25, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.send_sharp,
                      size: 25,
                    ),
                    SizedBox(width: 22),
                    Text(
                      'Sent',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter-Bold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 25, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.drafts_sharp,
                      size: 25,
                    ),
                    SizedBox(width: 22),
                    Text(
                      'Draft',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter-Bold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 25, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      size: 25,
                    ),
                    SizedBox(width: 22),
                    Text(
                      'Bin',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter-Bold',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 25, 0, 0),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (_) => false);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.black,
                        size: 25,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter-Bold',
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(50)),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => _scaffoldKey.currentState!.openDrawer(),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {},
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 9, 128, 226),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Compose()));
        },
        child: Icon(
          color: const Color.fromARGB(255, 255, 255, 255),
          Icons.edit,
        ),
      ),
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 12, 0, 7),
              child: Text(
                'Updates',
                style: TextStyle(
                    color: Color.fromARGB(189, 20, 17, 17),
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
          ),
          Expanded(
            child: ListView.builder(// displaying the fetched emails list
              itemCount: emails.length,
              itemBuilder: (context, index) => MailList(email: emails[index]),
            ),
          ),
        ],
      ),
    );
  }
}
