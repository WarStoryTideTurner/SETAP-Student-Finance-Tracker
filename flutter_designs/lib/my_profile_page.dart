import 'package:flutter/material.dart';
import 'package:flutter_designs/main.dart';
import 'package:flutter_designs/my_profile_editing_page.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  TextEditingController name = TextEditingController(
    text: "${profile.getName} ${profile.getSurname}",
  );
  TextEditingController email = TextEditingController(text: profile.getEmail);
  TextEditingController phone = TextEditingController(text: profile.getPhoneNumber);

  double sectionWidth = 250.0;
  double sectionHeight = 250.0;

  String text2 = "Share Profile";

  bool alternate2 = true;

  // void _onSharePressed() {
  //   setState(() {
  //     if (alternate2) {
  //       text2 = "Pressed!";
  //       alternate2 = false;
  //     } else {
  //       text2 = "Share Profile";
  //       alternate2 = true;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("My Profile")),
        body: Center(
            child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.all(20.0),
                child: SizedBox(
                    child: Wrap(children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(backgroundImage: AssetImage(profile.getProfilePicture), radius: 50),
                    const SizedBox(
                      height: 10,
                    ),
                    IntrinsicWidth(
                      child: TextField(
                        controller: name,
                        readOnly: true,
                        enableInteractiveSelection: false,
                        mouseCursor: SystemMouseCursors.basic,
                        decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.only(bottom: 10.0), isDense: true),
                      ),
                    ),
                    IntrinsicWidth(
                      child: TextField(
                        controller: email,
                        readOnly: true,
                        enableInteractiveSelection: false,
                        mouseCursor: SystemMouseCursors.basic,
                        decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.only(bottom: 10.0), isDense: true),
                      ),
                    ),
                    IntrinsicWidth(
                      child: TextField(
                        controller: phone,
                        readOnly: true,
                        enableInteractiveSelection: false,
                        mouseCursor: SystemMouseCursors.basic,
                        decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.zero, isDense: true),
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
                        onPressed: () async {
                          await Navigator.of(context).push(MaterialPageRoute<MyProfileEditingPage>(builder: ((context) {
                            return const MyProfileEditingPage();
                          })));
                          setState(() {
                            name.text = "${profile.getName} ${profile.getSurname}";
                            email.text = profile.getEmail;
                            phone.text = profile.getPhoneNumber;
                          });
                        },
                        child: const Text("Edit Profile"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // SizedBox( // Share Profile Button
                    //   height: 25,
                    //   width: 120,
                    //   child: TextButton(
                    //       style: ButtonStyle(backgroundColor:
                    //           MaterialStateProperty.resolveWith(
                    //               (states) {
                    //         return Colors.black;
                    //       })),
                    //       onPressed: _onSharePressed,
                    //       child: Text(text2)),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                  ]),
                  const SizedBox(
                    width: 10,
                  ),
                ]))),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(20.0),
              child: SizedBox(
                  width: sectionWidth,
                  child: const Wrap(
                    children: [Text('Current House')],
                  )),
            )
          ],
        )));
  }
}
