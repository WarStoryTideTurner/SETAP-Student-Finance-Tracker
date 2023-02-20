import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String text = "Edit Profile";
  String text2 = "Share Profile";

  bool alternate = false;
  bool alternate2 = false;

  void _onEditPressed() {
    setState(() {
      if (alternate) {
        text = "Pressed!";
        alternate = false;
      }
      else {
        text = "Edit Profile";
        alternate = true;
      }
    });
  }
  void _onSharePressed() {
    setState(() {
      if (alternate2) {
        text2 = "Pressed!";
        alternate2 = false;
      }
      else {
        text2 = "Share Profile";
        alternate2 = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/pfp1.jpg'),
              radius: 50
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Name',                
                ),
                Text(
                  'Email',
                ),
                Text(
                  'Phone Number',
                ),
              ],
            )
          ]
        ),
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 25,
              width: 120,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.black;
                  })
                ),
                onPressed: _onEditPressed,
                child: Text (
                  text
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 25,
              width: 120,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return Colors.black;
                  })
                ),
                onPressed: _onSharePressed,
                child: Text (
                  text2
                )
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: const [
                Text (
                  'Current House'
                )
              ],
            )
          ],
        ),
      ]
    );
  }
}
