import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final _formKey = GlobalKey<FormState>();

  double sectionWidth = 250.0;
  double sectionHeight = 250.0;

  String text = "Edit Profile";
  String text2 = "Share Profile";

  bool alternate = true;
  bool alternate2 = true;

  void _onSharePressed() {
    setState(() {
      if (alternate2) {
        text2 = "Pressed!";
        alternate2 = false;
      } else {
        text2 = "Share Profile";
        alternate2 = true;
      }
    });
  }

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
                    width: sectionWidth,
                    child: Wrap(children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/pfp1.jpg'),
                                  radius: 50),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
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
                              ),
                            ]),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 25,
                              width: 120,
                              child: TextButton(
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  return Colors.black;
                                })),
                                onPressed: () {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Stack(
                                            children: <Widget>[
                                              Form(
                                                key: _formKey,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.red,
                                                        child:
                                                            Icon(Icons.close),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextFormField(
                                                        decoration:
                                                            const InputDecoration(
                                                                hintText:
                                                                    "Name"),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextFormField(
                                                          decoration:
                                                              const InputDecoration(
                                                                  hintText:
                                                                      "Email")),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: ElevatedButton(
                                                        child: const Text(
                                                            "Submit"),
                                                        onPressed: () {
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            _formKey
                                                                .currentState!
                                                                .save();
                                                          }
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Text(text),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 25,
                              width: 120,
                              child: TextButton(
                                  style: ButtonStyle(backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) {
                                    return Colors.black;
                                  })),
                                  onPressed: _onSharePressed,
                                  child: Text(text2)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
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
                  child: Wrap(
                    children: const [Text('Current House')],
                  )),
            )
          ],
        )));
  }
}
