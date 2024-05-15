// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mail_client/inbox.dart';
import 'package:mail_client/login.dart';
import 'package:mail_client/mail.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/view':(context) => const Message(),
        '/inbox': (context) => const Inbox(),
        '/login': (context) => const Login(),
      },
    ));
