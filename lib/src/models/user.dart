// template class for a mail fetched from the server and sent from the user
class Mail {
  final String sender;
  final String subject;
  final String body;
  DateTime? dateTime;
  Mail(
      {required this.sender,
      required this.subject,
      required this.body,
      required this.dateTime});
}
