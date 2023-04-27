import 'package:flutter/material.dart';

class MyRentPage extends StatefulWidget {
  const MyRentPage({super.key});

  @override
  State<MyRentPage> createState() => _MyRentPageState();
}

class _MyRentPageState extends State<MyRentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('House Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 80.0,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '123 Some Street',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text('Portsmouth, PO4 2DF',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ), //xwPadding(padding: xw)
        ],
      ),
    );
  }
}

class StudentsProfiles extends StatelessWidget {
  const StudentsProfiles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
