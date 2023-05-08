import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MoneyManagerApp());
}

class MoneyManagerApp extends StatelessWidget {
  const MoneyManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                navigateToHome(context);
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                navigateToHome(context);
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color welcomeColor = Colors.purple;
  Color rentMoneyPotColor = Colors.white;
  Color houseColor = Colors.red;
  Color profileColor = Colors.green;
  Color inboxColor = Colors.blue;
  Color mapColor = Colors.orange;
  Color containerColor = Colors.yellowAccent;

  // void onContainerClick(String containerName) {
  //   switch (containerName) {
  //     case 'House':
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => HousePage()),
  //       );
  //       break;
  //     case 'Profile':
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => ProfilePage()),
  //       );
  //       break;
  //     case 'Map':
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => MapPage()),
  //       );
  //       break;
  //     case 'Inbox':
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => InboxPage()),
  //       );
  //       break;
  //      case 'Rent':
  //        Navigator.push(
  //          context,
  //          MaterialPageRoute(builder: (context) => RentPage()),
  //        );
  //       break;
  //     default:
  //       print('Unknown container name: $containerName');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime firstDayOfNextMonth = DateTime(now.year, now.month + 1, 1);
    Duration duration = firstDayOfNextMonth.difference(now);
    int daysLeft = duration.inDays;
    return MaterialApp(
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
                child: GestureDetector(
                  // onTap: () => onContainerClick('Rent'),
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
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          // onTap: () => onContainerClick('House'),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: houseColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(height: 8),
                                Text(
                                  'House',
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
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          // onTap: () => onContainerClick('Profile'),
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
                          // onTap: () => onContainerClick('Inbox'),
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
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    // onTap: () => onContainerClick('Map'),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: mapColor,
                      child: Stack(
                        children: [
                          const GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(37.7749, -122.4194),
                              zoom: 12,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
