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
    return Scaffold(
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
              title: Text("Item 1"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Item 2"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Item 3"),
              onTap: () {},
            )
          ],
        ),
      ),
      body: Column(
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
                children: [
                  const Text(
                    "123 Perfect Street",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  const Text(
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
          )
        ],
      ),
    );
  }
}
// appBar: AppBar(
//   title: const Text('House Profile'),
// ),
// endDrawer: Drawer(
//   child: ListView(
//     padding: EdgeInsets.zero,
//     children: <Widget>[
//       Container(
//         height: 50,
//         child: const DrawerHeader(
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(20),
//               bottomRight: Radius.circular(20),
//               ),
//             ),
//             child: Center(
//                 child: Text(
//               "Header",
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: "Rubik"),
//             )),
//           ),
//         ),
//       ),
//       ListTile(
//         title: Text("Item 1"),
//         onTap: () {
//           //Functionality
//         },
//       ),
//       ListTile(
//         title: Text("Item 2"),
//         onTap: () {
//           //Functionality
//         },
//       ),
//       ListTile(
//         title: Text("Item 3"),
//         onTap: () {
//           //Functionality
//         },
//             )
//           ],
//         ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Center(
//             child: CircleAvatar(
//               radius: 80.0,
//               backgroundImage: AssetImage('assets/images/house1.jpeg'),
//             ),
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text(
//                     '123 Some Street',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8.0),
//                   Text(
//                     'Portsmouth, PO4 2DF',
//                     style:
//                         TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//               ListTile(
//                 title: const Text("Item 2"),
//                 onTap: () {
//                   //Functionality
//                 },
//               ),
//               ListTile(
//                 title: const Text("Item 3"),
//                 onTap: () {
//                   //Functionality
//                 },
//               )
//             ],
//           ),
//           const SizedBox(height: 16.0),
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 209, 204, 204),
//               borderRadius: BorderRadius.circular(8),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 1,
//                   blurRadius: 3,
//                   offset: const Offset(0, 3),
//                 )
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Center(
//                   child: Text(
//                     "House mates",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//               ),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Text(
//                         '123 Some Street',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 8.0),
//                       Text(
//                         'Portsmouth, PO4 2DF',
//                         style: TextStyle(
//                             fontSize: 16.0, fontWeight: FontWeight.bold),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 209, 204, 204),
//                   borderRadius: BorderRadius.circular(8),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 1,
//                       blurRadius: 3,
//                       offset: const Offset(0, 3),
//                     )
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Center(
//                       child: Text(
//                         "House mates",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     SizedBox(
//                       height: 120,
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: [
//                           _createRoomMatesProfiles(
//                               'assets/images/profilePictures/person1.jpg'),
//                           _createRoomMatesProfiles(
//                               'assets/images/profilePictures/person2.jpg'),
//                           _createRoomMatesProfiles(
//                               'assets/images/profilePictures/person3.jpg'),
//                           _createRoomMatesProfiles(
//                               'assets/images/profilePictures/person4.jpg'),
//                           _createRoomMatesProfiles(
//                               'assets/images/profilePictures/person5.jpg'),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text(
//                       "Electricity",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: const [
//                         Text(
//                           "Electricity",
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Center(
//                   child: Text(
//                     "Money pot",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Center(
//                       child: Text(
//                         "Money pot",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: const [Text("Amount Accumulated ")])
//                   ],
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [Text("Amount Accumulated ")])
//               ],
//             ),
//           ) //xwPadding(padding: xw)
//         ],
//       ),
//     );
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
