// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});
  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  // final String data;
  // _MessageState({required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Add your delete action here
            },
          ),
        ],
      ),
    );
  }
}
// class MailMessagePage extends StatelessWidget {
//   final Mail mail;

//   MailMessagePage(this.mail);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mail'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     child: Text(mail.sender.substring(0, 1).toUpperCase()),
//                   ),
//                   SizedBox(width: 10),
//                   Text(
//                     mail.sender,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Text(
//                 mail.subject,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 mail.body,
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Mail {
//   final String sender;
//   final String subject;
//   final String body;

//   Mail({required this.sender, required this.subject, required this.body});
// }

