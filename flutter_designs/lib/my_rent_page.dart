// import 'dart:ffi';

import 'package:flutter/material.dart';

class MyRentPage extends StatefulWidget {
  const MyRentPage({super.key});

  @override
  State<MyRentPage> createState() => _MyRentPageState();
}

//
class _MyRentPageState extends State<MyRentPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("House Profile"),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 50,
                child: const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      "Header",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text("Item 1"),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Item 2"),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Item 3"),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Item 4"),
                onTap: () {},
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/house1.jpeg'),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "123 Perfect Street",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Portsmouth, PO4 21S",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 234, 231, 231),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "House mates",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _createRoomMatesProfiles(
                              'assets/images/profilePictures/person1.jpg'),
                          _createRoomMatesProfiles(
                              'assets/images/profilePictures/person2.jpg'),
                          _createRoomMatesProfiles(
                              'assets/images/profilePictures/person3.jpg'),
                          _createRoomMatesProfiles(
                              'assets/images/profilePictures/person4.jpg'),
                          _createRoomMatesProfiles(
                              'assets/images/profilePictures/person5.jpg'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 234, 231, 231),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Rent & Bills",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Rent",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          "£2000",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 234, 231, 231),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Money pot",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return NumericPad(
                                      onPressed: _addToMoneyPot,
                                    );
                                  });
                            },
                            child: const Text("Pay"),
                          ),
                          Text("Total Amount: £$_totalAmount"),
                        ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//
  double _totalAmount = 0;

  void _addToMoneyPot(String amount) {
    setState(() {
      _totalAmount += double.parse(amount);
    });
  }
}

Widget _createRoomMatesProfiles(String imagePath) {
  return Padding(
    padding: const EdgeInsets.only(right: 16),
    child: CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage(imagePath),
    ),
  );
}

class NumericPad extends StatefulWidget {
  final Function(String) onPressed;

  const NumericPad({required this.onPressed});

  @override
  _NumericPadState createState() => _NumericPadState();
}

class _NumericPadState extends State<NumericPad> {
  late String _enteredAmount = "";

  void _addToAmount(String number) {
    setState(() {
      _enteredAmount += number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Enter the amount: ",
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: "£0.00",
              border: OutlineInputBorder(),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            controller: TextEditingController(text: _enteredAmount),
            onChanged: (value) {
              _enteredAmount = value;
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton("1"),
              _buildNumberButton("2"),
              _buildNumberButton("3")
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton("4"),
              _buildNumberButton("5"),
              _buildNumberButton("6")
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton("7"),
              _buildNumberButton("8"),
              _buildNumberButton("9")
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton("."),
              _buildNumberButton("0"),
              IconButton(
                icon: const Icon(Icons.backspace),
                onPressed: () {
                  setState(() {
                    _enteredAmount = _enteredAmount.substring(
                      0,
                      _enteredAmount.isNotEmpty ? _enteredAmount.length - 1 : 0,
                    );
                  });
                },
              )
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                widget.onPressed(_enteredAmount);
                Navigator.of(context).pop();
              },
              child: const Text("Pay"))
        ],
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return ElevatedButton(
      onPressed: () {
        _addToAmount(number);
      },
      child: Text(number),
    );
  }
}
//