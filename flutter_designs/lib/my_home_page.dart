import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_designs/my_profile_page.dart';
import 'package:flutter_designs/main.dart';
import 'package:flutter_designs/my_inbox_page.dart';
import 'package:flutter_designs/my_map_page.dart';
import 'package:flutter_designs/my_rent_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String username = "user"; // Replace with the actual username
  int moneyPotAmount = 90; // Updated amount
  int rentBillAmount = 400;

  Color welcomeColor = const Color.fromARGB(255, 241, 164, 255);
  Color rentMoneyPotColor = const Color.fromARGB(255, 211, 208, 208);
  Color profileColor = const Color.fromARGB(255, 248, 228, 197);
  Color inboxColor = const Color.fromARGB(255, 184, 222, 253);
  Color mapColor = Colors.red;
  Color containerColor = Colors.yellowAccent;

  void onContainerClick(String containerName) {
    switch (containerName) {
      case 'Profile':
        print('Container clicked: $Route');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyProfilePage()),
        );
        break;
      case 'Map':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyMapPage()),
        );
        break;
      case 'Inbox':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyInboxPage()),
        );
        break;
      case 'Rent':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyRentPage()),
        );
        break;
      default:
        print('Unknown container name: $containerName');
    }
  }

  TextEditingController name = TextEditingController(text: profile.getName);
  TextEditingController email = TextEditingController(text: profile.getEmail);
  TextEditingController phoneNumber =
      TextEditingController(text: profile.getPhoneNumber);
  TextEditingController profilePic =
      TextEditingController(text: profile.getProfilePicture);
  TextEditingController surname =
      TextEditingController(text: profile.getSurname);

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
                child: Center(
                  child: Text(
                    'Welcome, $username!',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => onContainerClick('Rent'),
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
                        const SizedBox(height: 8),
                        Text(
                          'Amount: £${rentBillAmount.toString()}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Money Pot Amount: £${moneyPotAmount.toString()}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
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
                        child: GestureDetector(
                          onTap: () => onContainerClick('Profile'),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: profileColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 8),
                                IntrinsicWidth(
                                  child: TextField(
                                    controller: name,
                                    readOnly: true,
                                    enableInteractiveSelection: false,
                                    mouseCursor: SystemMouseCursors.basic,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(bottom: 10.0),
                                        isDense: true),
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: TextField(
                                    controller: email,
                                    readOnly: true,
                                    enableInteractiveSelection: false,
                                    mouseCursor: SystemMouseCursors.basic,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(bottom: 10.0),
                                        isDense: true),
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: TextField(
                                    controller: phoneNumber,
                                    readOnly: true,
                                    enableInteractiveSelection: false,
                                    mouseCursor: SystemMouseCursors.basic,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(bottom: 10.0),
                                        isDense: true),
                                  ),
                                ),
                                IntrinsicWidth(
                                  child: TextField(
                                    controller: profilePic,
                                    readOnly: true,
                                    enableInteractiveSelection: false,
                                    mouseCursor: SystemMouseCursors.basic,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(bottom: 10.0),
                                        isDense: true),
                                  ),
                                ),
                              ],
                            ),
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
                        child: GestureDetector(
                          onTap: () => onContainerClick('Inbox'),
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
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
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
                    child: GestureDetector(
                      onTap: () => onContainerClick('Map'),
                      child: Stack(
                        children: [
                          GoogleMap(
                              initialCameraPosition: const CameraPosition(
                                target: LatLng(37.7749, -122.4194),
                                zoom: 12,
                              ),
                              zoomControlsEnabled: false,
                              scrollGesturesEnabled: false,
                              rotateGesturesEnabled: false,
                              tiltGesturesEnabled: false,
                              zoomGesturesEnabled: false,
                              gestureRecognizers: Set()
                              // ..add(Factory<EagerGestureRecognizer>(
                              //     () => EagerGestureRecognizer())),
                              ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.map,
                                color: Color.fromARGB(255, 246, 130, 41),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
