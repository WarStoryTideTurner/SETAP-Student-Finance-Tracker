import 'package:flutter/material.dart';
import 'package:flutter_designs/main.dart';

class MyProfileEditingPage extends StatefulWidget {
  const MyProfileEditingPage({super.key});

  @override
  State<MyProfileEditingPage> createState() => _MyProfileEditingState();
}

class _MyProfileEditingState extends State<MyProfileEditingPage> {
  TextEditingController fname = TextEditingController(text: profile.getName);
  TextEditingController lname = TextEditingController(text: profile.getSurname);
  TextEditingController email = TextEditingController(text: profile.getEmail);
  TextEditingController phoneNumber = TextEditingController(text: profile.getPhoneNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Editing Page'),
        ),
        body: Center(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            CircleAvatar(backgroundImage: AssetImage(profile.getProfilePicture), radius: 50),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85 * 0.5 - 15,
                    child: TextField(
                      decoration: const InputDecoration(
                        label: Text("First Name"),
                      ),
                      controller: fname,
                    ),
                  ),
                  const VerticalDivider(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85 * 0.5 - 15,
                    child: TextField(
                      decoration: const InputDecoration(
                        label: Text("Last Name"),
                      ),
                      controller: lname,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextField(
                decoration: const InputDecoration(
                  label: Text("Email"),
                ),
                controller: email,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextField(
                decoration: const InputDecoration(
                  label: Text("Phone Number"),
                ),
                controller: phoneNumber,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 25,
              width: 120,
              child: TextButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.black;
                })),
                onPressed: () {
                  profile.setName = fname.text;
                  profile.setSurname = lname.text;
                  profile.setEmail = email.text;
                  profile.setPhoneNumber = phoneNumber.text;
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ));
  }
}
