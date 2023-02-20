import 'package:flutter/material.dart';

class MyInboxPage extends StatefulWidget {
  const MyInboxPage ({super.key});

  @override
  State<MyInboxPage> createState() => _MyInboxPageState();
}

class _MyInboxPageState extends State<MyInboxPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Text(
        'Inbox Page',
      )
    );
  }
}