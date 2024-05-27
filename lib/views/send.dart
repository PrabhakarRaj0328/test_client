// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:io';
import 'package:enough_mail/enough_mail.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String imapServerHost = 'newmailhost.cc.iitk.ac.in';
int imapServerPort = 993;
bool isImapServerSecure = true;
String smtpServerHost = 'smtp.cc.iitk.ac.in';
int smtpServerPort = 465;
bool isSmtpServerSecure = true;
String? username;
String? password;

Future<void> imapExample() async {
  await dotenv.load(fileName: "assets/.env");

  username = 'prabhakar23';
  password = dotenv.env['password'];
  final client = ImapClient(isLogEnabled: false);
  try {
    await client.connectToServer(imapServerHost, imapServerPort,
        isSecure: isImapServerSecure);
    await client.login(username!, password!);

    final mailboxes = await client.listMailboxes();
    print('mailboxes: $mailboxes');
    await client.selectInbox();

    final fetchResult = await client.fetchRecentMessages(
        messageCount: 10, criteria: 'BODY.PEEK[]');
    for (final message in fetchResult.messages) {
      printMessage(message);
    }
    await client.logout();
  } on ImapException catch (e) {
    print('IMAP failed with $e');
  }
}

Future<void> smtpExample(String senderMail, String recipientMail,
    String subject, String body) async {
  final client = SmtpClient('smtp.cc.iitk.ac.in', isLogEnabled: true);
  await dotenv.load(fileName: "assets/.env");

  username = dotenv.env['userName'];
  password = dotenv.env['password'];
  try {
    await client.connectToServer(smtpServerHost, smtpServerPort,
        isSecure: isSmtpServerSecure);
    print('Connected to SMTP server.');

    await client.ehlo();
    print('EHLO command sent.');

    if (client.serverInfo.supportsAuth(AuthMechanism.plain)) {
      await client.authenticate(username!, password!, AuthMechanism.plain);
      print('Authenticated using PLAIN mechanism.');
    } else if (client.serverInfo.supportsAuth(AuthMechanism.login)) {
      await client.authenticate(username!, password!, AuthMechanism.login);
      print('Authenticated using LOGIN mechanism.');
    } else {
      print('No supported authentication mechanism found.');
      return;
    }
    var sName = '';
    var rName = '';
    for (int i = 0; i < senderMail.length; i++) {
      if (senderMail[i] == '@') break;
      sName = sName + senderMail[i];
    }
    for (int i = 0; i < recipientMail.length; i++) {
      if (recipientMail[i] == '@') break;
      rName = rName + recipientMail[i];
    }
    final builder = MessageBuilder.prepareMultipartAlternativeMessage(
      plainText: body,
      htmlText: '<p>$body</p>',
    )
      ..from = [MailAddress(sName, senderMail)]
      ..to = [MailAddress(rName, recipientMail)]
      ..subject = subject;
    final mimeMessage = builder.buildMimeMessage();
    final sendResponse = await client.sendMessage(mimeMessage);

    if (sendResponse.isOkStatus) {
      print('Message sent successfully.');
    } else {
      print('Failed to send message:');
    }
  } on SmtpException catch (e) {
    print('SMTP failed with $e');
  } finally {
    await client.disconnect();
    print('Disconnected from SMTP server.');
  }
}

void printMessage(MimeMessage message) {
  print('From: ${message.from}');
  print('Subject: ${message.decodeSubject()}');
  print('Date: ${message.decodeDate()}');
  print('Body: ${message.decodeTextPlainPart()}');
}
