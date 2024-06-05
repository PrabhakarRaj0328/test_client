// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mail_client/src/services/send.dart';

class Compose extends StatefulWidget {
  const Compose({super.key});

  @override
  State<Compose> createState() => _ComposeState();
}
// interface for the user to compose a mail and send to the reciever
class _ComposeState extends State<Compose> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.attach_file),
            SizedBox(width: 15),
            IconButton(
                icon: Icon(Icons.send_sharp),// button used to send the mail
                onPressed: () {
                  
                  smtpExample(
                    _fromController.text,
                    _toController.text,
                    _subjectController.text,
                    _bodyController.text,
                  );
                }),
            SizedBox(width: 15),
            Icon(Icons.more_vert),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 10.0, 0, 0),
                    child: Text(
                      'From',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inter-Bold',
                        color: Color.fromARGB(255, 50, 49, 49),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      maxLines: null,
                      controller: _fromController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 3,
                thickness: 0.3,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 10.0, 0, 0),
                    child: Text(
                      'To',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inter-Bold',
                        color: Color.fromARGB(255, 50, 49, 49),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextFormField( // Input recievers address here
                      maxLines: null,
                      controller: _toController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 3,
                thickness: 0.3,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 10, 0, 0),
                child: TextFormField(  // input subject
                  controller: _subjectController,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Subject',
                    hintStyle: TextStyle(fontSize: 18),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Divider(
                height: 3,
                thickness: 0.3,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 10, 0, 0),
                child: TextFormField( // input body
                  maxLines: null,
                  controller: _bodyController,
                  decoration: InputDecoration(
                    hintText: 'Compose email',
                    hintStyle: TextStyle(fontSize: 18),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
