import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';
import 'package:mail_client/src/services/send.dart';

String imapServerHost = 'newmailhost.cc.iitk.ac.in';
int imapServerPort = 993;
bool isImapServerSecure = true;

// Checks whether the user is valid or not by connecting with iitk imap server and
// authenticating user input data and if the user is valid then fetches the email from
// imap server and displays them
void authenticateIMAP(
    BuildContext context, String username, String password) async {
  final client = ImapClient(isLogEnabled: true);

  try {
    await client.connectToServer(imapServerHost, imapServerPort,
        isSecure: true);
    await client.login(username, password);
    print('Authenticated successfully');
    _showSnackBar(context, 'Authenticated successfully');

    await client.logout();
    await client.disconnect();
    imapExample(context); // fetches the mail
  } catch (e) {
    print('Authentication failed. Error: $e');
    _showSnackBar(context, 'Incorrect Username or password');
  }
}

// prompts user with respective result of success or failure
void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
