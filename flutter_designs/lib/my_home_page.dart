import 'package:flutter/material.dart';
import 'package:flutter_designs/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color welcomeColor = Colors.purple;
  Color rentMoneyPotColor = Colors.white;
  Color profileColor = Colors.green;
  Color inboxColor = Colors.blue;
  Color mapColor = Colors.orange;
  Color containerColor = Colors.yellowAccent;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime firstDayOfNextMonth = DateTime(now.year, now.month + 1, 1);
    Duration duration = firstDayOfNextMonth.difference(now);
    int daysLeft = duration.inDays;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100,
                color: welcomeColor,
                child: const Center(
                  child: Text(
                    'Welcome, User!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: rentMoneyPotColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'Due in $daysLeft days',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),

                      //This will create a DateTime object for the first day of the next month, calculate the duration between that date and the current date using the difference method, and get the number of days from that duration using the inDays property. You can replace the current "Due in 27 days" text with the above code to show the correct number of days left.
                      const SizedBox(height: 8),
                      const Text(
                        'Rent amount: £400',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Money Pot amount: £90',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: profileColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(height: 8),
                              Text(
                                'Profile',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: inboxColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(height: 8),
                              Text(
                                'Inbox',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: mapColor,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(50.9306584530237, -1.295606409622299),
                            zoom: 15,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.map,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Map',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
