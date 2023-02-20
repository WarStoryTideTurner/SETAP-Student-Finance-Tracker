import 'package:flutter/material.dart';

class MyRentPage extends StatefulWidget {
  const MyRentPage ({super.key});

  @override
  State<MyRentPage> createState() => _MyRentPageState();
}

class _MyRentPageState extends State<MyRentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Text(
        'Rent Page',
      )
    );
  }
}