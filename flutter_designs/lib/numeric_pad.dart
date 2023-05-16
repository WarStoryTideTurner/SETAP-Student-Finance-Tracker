import 'package:flutter/material.dart';

class NumericPad extends StatefulWidget {
  final Function(String) onPressed;

  const NumericPad({super.key, required this.onPressed});

  @override
  NumericPadState createState() => NumericPadState();
}

class NumericPadState extends State<NumericPad> {
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
            children: [_buildNumberButton("1"), _buildNumberButton("2"), _buildNumberButton("3")],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_buildNumberButton("4"), _buildNumberButton("5"), _buildNumberButton("6")],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_buildNumberButton("7"), _buildNumberButton("8"), _buildNumberButton("9")],
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
