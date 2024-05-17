// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mail_client/views/mail_widget.dart';

class Message extends StatelessWidget {
  final Mail email;

  const Message({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.archive),
              SizedBox(width: 15),
              Icon(Icons.delete),
              SizedBox(width: 15),
              Icon(Icons.more_vert),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  email.subject,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Inter-Bold',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 167, 211, 247),
                      child: Text(
                        email.sender.substring(0, 1).toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Inter-Bold',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            email.sender,
                            style: TextStyle(
                              fontFamily: 'Inter-Bold',
                              fontSize: 20,
                            ),
                          ),
                          Row(children: [
                            Text('to me'),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(Icons.arrow_drop_down)
                          ])
                        ])
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  email.body,
                  style: TextStyle(
                    color: Color.fromARGB(255, 74, 74, 74),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.reply),
                        TextButton(
                          child: Text('Reply',
                              style: TextStyle(
                                color: Color.fromARGB(255, 50, 49, 49),
                              )),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.reply_all),
                        TextButton(
                          child: Text('Reply all',
                              style: TextStyle(
                                color: Color.fromARGB(255, 50, 49, 49),
                              )),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.forward),
                        TextButton(
                          child: Text('Forward',
                              style: TextStyle(
                                color: Color.fromARGB(255, 50, 49, 49),
                              )),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
