// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final List<Mail> emails = [
    Mail(
      sender: 'Quora Digest',
      subject: 'What does childbirth feel like?',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
    Mail(
      sender: 'Amazon.in',
      subject: 'Your Feedback Matters. Would You Recommend Us',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
    Mail(
      sender: 'LinkedIn',
      subject: '📩 Prabhakar Raj, you have a new invitation and notification',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
    Mail(
      sender: 'Discord',
      subject: 'Updates to Discord’s Policies.',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
    Mail(
      sender: 'Postman',
      subject:
          'Join Postman Student Program & claim your Student Expert Badge.',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
    Mail(
      sender: 'Uber',
      subject: 'Ready to ride again? Save up to 20% 🎉!',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
    Mail(
      sender: 'AtCoder',
      subject: 'AtCoder Grand Contest 066 Announcement',
      body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inbox',
          style: TextStyle(
              fontFamily: 'Inter-Bold',
              fontWeight: FontWeight.w900,
              fontSize: 25.0),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 167, 211, 247),
        onPressed: () {},
        child: Icon(
          Icons.edit,
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
            child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: 'Search for emails and files',
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 9, 128, 226)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 9, 128, 226)),
                  ),
                ),
                cursorColor: const Color.fromARGB(255, 9, 128, 226)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: emails.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    _buildEmailTile(emails[index]),
                    Divider(height: 4.0),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildEmailTile(Mail email) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Color.fromARGB(255, 167, 211, 247),
      child: Text(
        email.sender.substring(0, 1).toUpperCase(),
        style: TextStyle(
            fontFamily: 'Inter-Bold',
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: Colors.black),
      ),
    ),
    title: Text(email.sender),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(email.subject),
        Text(
          email.body,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
    onTap: () {
    },
  );
}

class Mail {
  final String sender;
  final String subject;
  final String body;

  Mail({required this.sender, required this.subject, required this.body});
}
