// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mail_client/views/mail_view.dart';
import 'package:mail_client/views/mail_widget.dart';

class MailList extends StatelessWidget {
  final Mail email;
  const MailList({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 9, 128, 226),
        child: Text(
          email.sender.substring(0, 1).toUpperCase(),
          style: TextStyle(
              fontFamily: 'Inter-Bold',
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 255, 255, 255)),
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
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Message(
                  email: email,
                )));
      },
    );
  }
}
