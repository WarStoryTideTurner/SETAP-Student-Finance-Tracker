import 'package:flutter/material.dart';

//Coded by Chris with a little help from ChatGPT
//**Needs to be changed to be more personal and less AI generated before submission
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedPage = 0;

  final _pageOptions = [
    const HomeScreen(),
    const HouseRent(),
    const MapPage(),
    const Inbox(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home Screen",
              backgroundColor: Color.fromARGB(255, 86, 189, 184)),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: "House Rent",
              backgroundColor: Color.fromARGB(255, 37, 196, 188)),
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: "Map",
              backgroundColor: Color.fromARGB(255, 21, 162, 155)),
          BottomNavigationBarItem(
              icon: Icon(Icons.inbox),
              label: "Inbox",
              backgroundColor: Color.fromARGB(255, 11, 137, 130)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "User Profile",
              backgroundColor: Color.fromARGB(255, 6, 99, 94)),
        ],
      ),
    );
  }
}

//Widget that handles stuff to do with the home screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 141, 236, 232),
      child: Center(
        child: pageOfBoxes,
      ),
    );
  }
}

final pageOfBoxes = Column(
  children: const [
    Text("This is where"),
    SizedBox(height: 20),
    Text("We can make"),
    SizedBox(height: 20),
    Text("Stuff to do"),
    SizedBox(height: 20),
    Text("With the home screen")
  ],
);

//Widget that handles stuff to do with the rent
class HouseRent extends StatelessWidget {
  const HouseRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 123, 231, 225),
      child: const Center(
        child: Text('House Rent'),
      ),
    );
  }
}

//Widget that handles stuff to do with the map
class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 96, 212, 207),
      child: const Center(
        child: Text('Map'),
      ),
    );
  }
}

//Widget that handles stuff to do with the user's inbox
class Inbox extends StatelessWidget {
  const Inbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 69, 202, 196),
      child: const Center(
        child: Text('Inbox'),
      ),
    );
  }
}

//Widget that handles stuff to do with the user's profile
class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 38, 182, 175),
      child: const Center(
        child: Text('User Profile'),
      ),
    );
  }
}
