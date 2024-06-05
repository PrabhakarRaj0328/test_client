// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mail_client/src/screens/login.dart';

// runs the app and directs to the login page
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        
        '/login': (context) => const Login(),
      },
    ));
