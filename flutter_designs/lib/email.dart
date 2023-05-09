class Email {
  final String sender;
  final String subject;
  final String message;

  bool selected = false;

  Email({
    required this.sender,
    required this.subject,
    required this.message,
  });
}
