// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mail_client/views/mail_widget.dart';
import 'package:mail_client/views/login.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/inbox': (context) => const Inbox(),
        '/login': (context) => const Login(),
      },
    ));
