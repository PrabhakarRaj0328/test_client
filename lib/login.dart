// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mail_client/inbox.dart';
// import 'package:mail_client/inbox.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _username = 'Mail';
  final String _password = 'Client';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Inter-Bold',
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text('To login and access your messages'),
                      Text('please log into your account'),
                      SizedBox(height: 50.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                            controller: _usernameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Username',
                              filled: true,
                              fillColor: Colors.grey[50],
                              prefixIcon: const Icon(Icons.person_outline),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 9, 128, 226)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 9, 128, 226)),
                              ),
                            ),
                            cursorColor:
                                const Color.fromARGB(255, 9, 128, 226)),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              filled: true,
                              fillColor: Colors.grey[50],
                              prefixIcon: const Icon(Icons.password_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 9, 128, 226)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color:
                                        const Color.fromARGB(255, 9, 128, 226)),
                              ),
                            ),
                            cursorColor:
                                const Color.fromARGB(255, 9, 128, 226)),
                      ),
                      SizedBox(height: 60.0),
                      SizedBox(
                        height: 50.0,
                        width: 300.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            String enteredUsername =
                                _usernameController.text.trim();
                            String enteredPassword = 
                                _passwordController.text.trim();
                            if (_formKey.currentState?.validate() ?? false) {
                              if (enteredUsername == _username &&
                                  enteredPassword == _password) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Inbox()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Incorrect username or password'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                          height: MediaQuery.of(context).viewInsets.bottom),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
