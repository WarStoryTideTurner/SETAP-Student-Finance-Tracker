// import 'dart:ffi';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoTimeText extends StatelessWidget {
  const CupertinoTimeText({
    Key? key,
    required this.selectedTime,
    required this.onTimeChanged,
  }) : super(key: key);

  final TimeOfDay selectedTime;
  final ValueChanged<TimeOfDay> onTimeChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoDatePicker(
      mode: CupertinoDatePickerMode.time,
      initialDateTime:
          DateTime(0, 0, 0, selectedTime.hour, selectedTime.minute),
      onDateTimeChanged: (DateTime dateTime) =>
          onTimeChanged(TimeOfDay.fromDateTime(dateTime)),
    );
  }
}

class MyRentPage extends StatefulWidget {
  const MyRentPage({Key? key}) : super(key: key);
  @override
  State<MyRentPage> createState() => _MyRentPageState();
}

//
class _MyRentPageState extends State<MyRentPage> {
  late Map<DateTime, List<Event>> _events;
  late List<Event> _selectedEvents;
  late DateTime _selectedDay;

  var body;
  List<Event> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  void initState() {
    super.initState();
    _events = {};
    _selectedEvents = [];
    _selectedDay = DateTime.now();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _selectedEvents = _events[selectedDay] ?? [];
    });
  }

  void _showAddEventDialog() async {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    // DateTime selectedDate = _selectedDay;
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDay,
      firstDate: DateTime.utc(2021, 01, 01),
      lastDate: DateTime.utc(2023, 12, 31),
    );
    // ignore: use_build_context_synchronously
    TimeOfDay? startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    // ignore: use_build_context_synchronously
    TimeOfDay? endTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now().replacing(hour: TimeOfDay.now().hour + 1),
    );
    // ignore: use_build_context_synchronously
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Event'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newEvent = Event(
                  title: titleController.text,
                  description: descriptionController.text,
                  startTime: DateTime(
                    selectedDate!.year,
                    selectedDate.month,
                    selectedDate.day,
                    startTime!.hour,
                    startTime.minute,
                  ),
                  endTime: DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    endTime!.hour,
                    endTime.minute,
                  ),
                );
                setState(() {
                  _events[selectedDate] = [
                    ..._events[selectedDate] ?? [],
                    newEvent
                  ];
                  _selectedEvents = _events[selectedDate] ?? [];
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //child: SafeArea(
      appBar: AppBar(
        title: const Text("House Profile"),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SafeArea(
              child: SizedBox(
                height: 50,
                child: DrawerHeader(
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
      body: ListView(
          // ignore: sort_child_properties_last
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return BillPayment();
                                  });
                            },
                            child: const Text(
                              "Pay",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
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
                          child: const Text(
                            "Pay",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text("Total Amount: £$_totalAmountMoneyPot"),
                      ],
                    )
                  ],
                ),
              ),
              // ]
              // ),
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
                //body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'UPCOMING EVENTS',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Table(
                                  children: [
                                    const TableRow(
                                      children: [
                                        Text(
                                          'Title',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Description',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Start Time',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'End Time',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    for (final event in _selectedEvents)
                                      TableRow(
                                        children: [
                                          Text(event.title),
                                          Text(event.description),
                                          Text(
                                              '${event.startTime.hour}:${event.startTime.minute.toString().padLeft(2, '0')}'),
                                          Text(
                                              '${event.endTime.hour}:${event.endTime.minute.toString().padLeft(2, '0')}'),
                                        ],
                                      ),
                                  ],
                                ))),
                        const SizedBox(height: 16),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: _showAddEventDialog,
                                  child: const Text("Add Event"))
                            ]),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ]),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _showAddEventDialog,
      //   child: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     children: const [
      //       Icon(Icons.add),
      //       SizedBox(width: 8),
      //       Tooltip(
      //         message: 'Add Event',
      //         child: Text('+'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  double _totalAmountMoneyPot = 0;

  //double _totalAmount = 0;

  void _addToMoneyPot(String amount) {
    setState(() {
      _totalAmountMoneyPot += double.parse(amount);
    });
  }
}

class Event {
  final String title; // Add this line
  final String description;
  final DateTime startTime;
  final DateTime endTime;

  Event({
    required this.title, // Add this line
    required this.description,
    required this.startTime,
    required this.endTime,
  });
}

//Creates a visible picture of other users at the property

Widget _createRoomMatesProfiles(String imagePath) {
  return Padding(
    padding: const EdgeInsets.only(right: 16),
    child: CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage(imagePath),
    ),
  );
}

class BillPaymentRecord {
  final String name;
  final String bill;
  final double amount;
  BillPaymentRecord(this.name, this.bill, this.amount);
}

class BillPayment extends StatefulWidget {
  @override
  BillPaymentState createState() => BillPaymentState();
}

class BillPaymentState extends State<BillPayment> {
  final List<String> _bills = ["Electricity", "Gas", "Water", "Rent"];
  String? _selectedBill;
  late double _amount;
  final List<BillPaymentRecord> _paymentRecords = [];

  void _selectBill(String bill) {
    setState(() {
      _selectedBill = bill;
    });
  }

  void _addToPaymentRecords(String name, String bill, double amount) {
    setState(() {
      _paymentRecords.insert(0, BillPaymentRecord(name, bill, amount));
      if (_paymentRecords.length > 3) {
        _paymentRecords.removeLast();
      }
    });
  }

  void _payBill() {
    if (_selectedBill == null) {
      return;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NumericPad(
          onPressed: (String enteredAmount) {
            final double amount = double.parse(enteredAmount);
            _amount = amount;
            _addToPaymentRecords("John John", _selectedBill!, amount);
            setState(() {
              _selectedBill = null;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Pay Bill"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select a bill to pay:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedBill,
              items: _bills
                  .map((bill) => DropdownMenuItem(
                        child: Text(bill),
                        value: bill,
                      ))
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  _selectedBill = value;
                });
              },
            ),
            const SizedBox(height: 16),
            if (_selectedBill != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter the amount to pay for $_selectedBill:",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  NumericPad(
                    onPressed: (value) {
                      setState(() {
                        _amount = double.parse(value);
                      });
                    },
                  )
                ],
              )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
            onPressed: () {
              if (_amount > 0) {
                _paymentRecords.insert(0,
                    BillPaymentRecord("Karol Karol", _selectedBill!, _amount));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Payment successful!"),
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            child: const Text("Pay"))
      ],
    );
  }
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
