// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_string_interpolations, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:mail_client/src/screens/mail_view.dart';
import 'package:mail_client/src/models/user.dart';

// Mail list which displays the recieved mail as a list item , its recieved time and day, sender
// subject,etc
class MailList extends StatelessWidget {
  final Mail email;
  const MailList({super.key, required this.email});
  @override
  Widget build(BuildContext context) {
    String data = '';
    List<String> weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    DateTime now = DateTime.now();
    if (email.dateTime!.day == now.day)
      data = 'Today';
    else
      data = '${weekdays[email.dateTime!.weekday - 1].substring(0, 3)}';
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
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(email.sender.length > 15
                ? email.sender.substring(0, 15)
                : email.sender),
            Text(data + ' ${email.dateTime!.hour}:${email.dateTime!.minute}')
          ],
        ),
        Text(email.subject, maxLines: 1, overflow: TextOverflow.ellipsis)
      ]),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Message(
                  email: email,
                )));
      },
    );
  }
}
