import 'package:flutter/material.dart';

class MyMapPage extends StatefulWidget {
  const MyMapPage ({super.key});

  @override
  State<MyMapPage> createState() => _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Text(
        'Map Page',
      )
    );
  }
}