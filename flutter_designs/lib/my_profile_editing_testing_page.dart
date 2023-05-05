import 'package:flutter/material.dart';

class MyProfileEditingTestingPage extends StatefulWidget {
  const MyProfileEditingTestingPage({super.key});

  @override
  State<MyProfileEditingTestingPage> createState() => _MyProfileEditingState();
}

class _MyProfileEditingState extends State<MyProfileEditingTestingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Profile Editing Page'),
    ));
  }
}
