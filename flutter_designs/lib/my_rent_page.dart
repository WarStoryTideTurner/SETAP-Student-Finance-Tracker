import 'package:flutter/material.dart';

class MyRentPage extends StatefulWidget {
  const MyRentPage({super.key});

  @override
  State<MyRentPage> createState() => _MyRentPageState();
}

class _MyRentPageState extends State<MyRentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('House Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/images/house1.jpeg'),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '123 Some Street',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Portsmouth, PO4 2DF',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 209, 204, 204),
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
                const Text(
                  "House mates",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
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
              color: const Color.fromARGB(255, 209, 204, 204),
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
                const Text(
                  "Rent & Bills",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Electricity",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 209, 204, 204),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Money pot",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text("Amount Accumulated ")])
              ],
            ),
          ) //xwPadding(padding: xw)
        ],
      ),
    );
  }
}

// class StudentsProfiles extends StatelessWidget {
//   const StudentsProfiles({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

Widget _createRoomMatesProfiles(String imagePath) {
  return Padding(
    padding: const EdgeInsets.only(right: 16),
    child: CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage(imagePath),
    ),
  );
}
