import 'package:flutter/material.dart';

class Email {
  final String sender;
  final String subject;
  final String message;

  bool selected = false;

  Email({
    required this.sender,
    required this.subject,
    required this.message,
  });
}

//Coded by Chris with a little help from ChatGPT
//**Needs to be changed to be more personal and less AI generated before submission
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false to remove the debug banner
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
    Inbox(),
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
//Coded by David with a little help from ChatGPT
//**Needs to be changed to be more personal and less AI generated before submission
class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  EmailPageState createState() => EmailPageState();
}

class EmailPageState extends State<Inbox> {
  final List<Email> emails = [
    Email(
      sender: 'john.doe@example.com',
      subject: 'Meeting',
      message: 'Hey, are you available for a meeting at 2 PM?',
    ),
    Email(
      sender: 'jane.doe@example.com',
      subject: 'Task assigned',
      message: 'You have been assigned a new task, please complete it by EOD.',
    ),
    Email(
      sender: 'bob.smith@example.com',
      subject: 'Reminder',
      message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
    ),
    Email(
      sender: 'steve.smith@example.com',
      subject: 'Reminder',
      message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
    ),
    Email(
      sender: 'jenny.smith@example.com',
      subject: 'Reminder',
      message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
    ),
    Email(
      sender: 'bob.smith@example.com',
      subject: 'Reminder',
      message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
    ),
    Email(
      sender: 'bob.smith@example.com',
      subject: 'Reminder',
      message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
    ),
    Email(
      sender: 'bob.smith@example.com',
      subject: 'Reminder',
      message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
    ),
    Email(
      sender: 'bob.smith@example.com',
      subject: 'Reminder',
      message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
    ),
    Email(
      sender: 'bob.smith@example.com',
      subject: 'Reminder',
      message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
    ),
    Email(
      sender: 'bob.smith@example.com',
      subject: 'Reminder',
      message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
    ),
    Email(
      sender: 'bob.smith@example.com',
      subject: 'Reminder',
      message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
    ),
    Email(
      sender: 'bob.smith@example.com',
      subject: 'Reminder',
      message: 'Just a reminder that our team meeting is tomorrow at 10 AM.',
    ),
    // Add more emails here...
  ];

  List<Email> selectedEmails = [];

  void toggleEmailSelected(Email email) {
    setState(() {
      email.selected = !email.selected;
      if (email.selected) {
        selectedEmails.add(email);
      } else {
        selectedEmails.remove(email);
      }
    });
  }

  void deleteSelectedEmails() {
    setState(() {
      selectedEmails.forEach((email) {
        emails.remove(email);
      });
      selectedEmails.clear();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedEmails.isEmpty ? 'Inbox' : '${selectedEmails.length} selected'),
        actions: [
          if (selectedEmails.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: deleteSelectedEmails,
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: emails.length,
              itemBuilder: (context, index) {
                final email = emails[index];
                return ListTile(
                  leading: Checkbox(
                    value: email.selected,
                    onChanged: (value) => toggleEmailSelected(email),
                  ),
                  title: Text(email.subject),
                  subtitle: Text(email.sender),
                  onTap: () {
                    // Navigate to email details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmailDetailsPage(email: email),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EmailDetailsPage extends StatelessWidget {
  final Email email;

  const EmailDetailsPage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From: ${email.sender}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              email.message,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
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
