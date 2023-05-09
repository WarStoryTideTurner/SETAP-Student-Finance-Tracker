import 'package:flutter/material.dart';
import 'package:flutter_designs/main.dart' as main;
import 'package:flutter_designs/email.dart';

//Widget that handles stuff to do with the user's inbox
//Coded by David with a little help from ChatGPT
//**Needs to be changed to be more personal and less AI generated before submission

class MyInboxPage extends StatefulWidget {
  const MyInboxPage({Key? key}) : super(key: key);

  @override
  State<MyInboxPage> createState() => _MyInboxPageState();
}

class _MyInboxPageState extends State<MyInboxPage> {
  List<Email> emails = main.emails;

  List<Email> selectedEmails = [];

  void toggleEmailSelected(Email email) {
    setState(() {
      email.selected = !email.selected;
      if (email.selected) {
        selectedEmails.add(email);
      } else {
        selectedEmails.remove(email);
      }
    });
  }

  void deleteSelectedEmails() {
    setState(() {
      selectedEmails.forEach((email) {
        emails.remove(email);
      });
      selectedEmails.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedEmails.isEmpty ? 'Inbox' : '${selectedEmails.length} selected'),
        actions: [
          if (selectedEmails.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: deleteSelectedEmails,
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: emails.length,
              itemBuilder: (context, index) {
                final email = emails[index];
                return ListTile(
                  leading: Checkbox(
                    value: email.selected,
                    onChanged: (value) => toggleEmailSelected(email),
                  ),
                  title: Text(email.subject),
                  subtitle: Text(email.sender),
                  onTap: () {
                    // Navigate to email details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmailDetailsPage(email: email),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EmailDetailsPage extends StatelessWidget {
  final Email email;

  const EmailDetailsPage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From: ${email.sender}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              email.message,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
