// import 'package:flutter/material.dart';
// import 'package:practice/Coding%20Age%20Project/About.dart';
// import 'package:practice/Coding%20Age%20Project/Downloads.dart';
// import 'package:practice/Coding%20Age%20Project/MyMusic.dart';
// import 'package:practice/Coding%20Age%20Project/PlayList.dart';
// import 'package:practice/Coding%20Age%20Project/setting.dart';
// import 'package:practice/appTest.dart';
// // Uncomment and adjust the path as necessary for MusicPlayerPage import
// // import 'package:practice/Coding%20Age%20Project/MusicPlayerPage.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage22(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class HomePage22 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       drawer: Drawer(
//         child: Container(
//           color: Colors.black,
//           child: ListView(
//             children: [
//               DrawerHeader(
//                 decoration: BoxDecoration(color: Colors.black12),
//                 child: Column(
//                   children: [
//                     Text(
//                       '\n My Music App',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   _buildDrawerItem(context, 'Home', Icons.home, HomePage22()),
//                   _buildDrawerItem(context, 'My Music', Icons.library_music, MyMusicPage()),
//                   _buildDrawerItem(context, 'Downloads', Icons.file_download_done, DownloadsPage()),
//                   _buildDrawerItem(context, 'Playlist', Icons.playlist_play_sharp, PlaylistPage()),
//                   _buildDrawerItem(context, 'Setting', Icons.settings, SettingsPage()),
//                   _buildDrawerItem(context, 'About', Icons.info, AboutPage()),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.all(16.0),
//             color: Colors.black,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Hi There,',
//                   style: TextStyle(
//                       color: Colors.green,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'Mr. Amit',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Songs, albums or artists',
//                     hintStyle: TextStyle(color: Colors.white54),
//                     prefixIcon: Icon(Icons.search, color: Colors.green),
//                     filled: true,
//                     fillColor: Colors.grey[900],
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 20),
//                     _buildSectionTitle('Trending Now'),
//                     _buildTrendingList(context, [
//                       {'image': 'assets/images/toba.jpg', 'title': 'Taoba Touba', 'subtitle': 'Karan Aujla (NewsBad)'},
//                       {'image': 'assets/images/tumse.jpg', 'title': 'Tum Se', 'subtitle': 'VArun Jain Album'},
//                       {'image': 'assets/images/bravan.jpg', 'title': 'Brown Rang', 'subtitle': 'Yo Yo Honey Singh'},
//                       {'image': 'assets/images/snak.jpg', 'title': 'Suna Hai', 'subtitle': 'Jubin Nautiyal'},
//                       {'image': 'assets/images/animal.jpg', 'title': 'Pahle Bhi Main', 'subtitle': 'Vishal Misra, (Animal)'},
//                       {'image': 'assets/images/pic3.jpg', 'title': 'Another Album', 'subtitle': 'Another Artist'},
//                     ]),
//                     SizedBox(height: 18),
//                     _buildSectionTitle('Top Charts'),
//                     _buildTrendingList(context, [
//                       {'image': 'assets/images/img.png', 'title': 'Calm Down', 'subtitle': 'Rema, Selena Gomez'},
//                       {'image': 'assets/images/pic1.jpg', 'title': 'Unholy', 'subtitle': 'Sam Smith, Kim Petras'},
//                       {'image': 'assets/images/pic3.jpg', 'title': 'Another Album', 'subtitle': 'Another Artist'},
//                       {'image': 'assets/images/img.png', 'title': 'Calm Down', 'subtitle': 'Rema, Selena Gomez'},
//                       {'image': 'assets/images/pic1.jpg', 'title': 'Unholy', 'subtitle': 'Sam Smith, Kim Petras'},
//                       {'image': 'assets/images/pic3.jpg', 'title': 'Another Album', 'subtitle': 'Another Artist'},
//                     ]),
//                     SizedBox(height: 18),
//                     _buildSectionTitle('New Release'),
//                     _buildTrendingList(context, [
//                       {'image': 'assets/images/toba.jpg', 'title': 'Taoba Touba', 'subtitle': 'Karan Aujla (NewsBad)'},
//                       {'image': 'assets/images/animal.jpg', 'title': 'Pahle Bhi Main', 'subtitle': 'Vishal Misra, (Animal)'},
//                       {'image': 'assets/images/animal.jpg', 'title': 'Pahle Bhi Main', 'subtitle': 'Vishal Misra, (Animal)'},
//                       {'image': 'assets/images/hiriye.jpg', 'title': 'Hiriye Hiriye', 'subtitle': 'Another Artist'},
//                       {'image': 'assets/images/img.png', 'title': 'Calm Down', 'subtitle': 'Rema, Selena Gomez'},
//                       {'image': 'assets/images/hiriye.jpg', 'title': 'Hiriye Hiriye', 'subtitle': 'Another Artist'},
//                       {'image': 'assets/images/img.png', 'title': 'Calm Down', 'subtitle': 'Rema, Selena Gomez'},
//                       {'image': 'assets/images/khamoshiaa.jpg', 'title': 'Khamoshiya', 'subtitle': 'Sam Smith, Kim Petras'},
//                       {'image': 'assets/images/aa.jpg', 'title': 'Another Album', 'subtitle': 'Another Artist'},
//                     ]),
//                     SizedBox(height: 18),
//                     _buildSectionTitle('New Release'),
//                     _buildTrendingList(context, [
//                       {'image': 'assets/images/animal.jpg', 'title': 'Pahle Bhi Main', 'subtitle': 'Vishal Misra, (Animal)'},
//                       {'image': 'assets/images/hiriye.jpg', 'title': 'Hiriye Hiriye', 'subtitle': 'Another Artist'},
//                       {'image': 'assets/images/img.png', 'title': 'Calm Down', 'subtitle': 'Rema, Selena Gomez'},
//                       {'image': 'assets/images/toba.jpg', 'title': 'Taoba Touba', 'subtitle': 'Karan Aujla (NewsBad)'},
//                       {'image': 'assets/images/animal.jpg', 'title': 'Pahle Bhi Main', 'subtitle': 'Vishal Misra, (Animal)'},
//                       {'image': 'assets/images/hiriye.jpg', 'title': 'Hiriye Hiriye', 'subtitle': 'Another Artist'},
//                       {'image': 'assets/images/img.png', 'title': 'Calm Down', 'subtitle': 'Rema, Selena Gomez'},
//                       {'image': 'assets/images/khamoshiaa.jpg', 'title': 'Khamoshiya', 'subtitle': 'Sam Smith, Kim Petras'},
//                       {'image': 'assets/images/aa.jpg', 'title': 'Another Album', 'subtitle': 'Another Artist'},
//                     ]),
//                     SizedBox(height: 18),
//                     _buildSectionTitle('New Release'),
//                     _buildTrendingList(context, [
//                       {'image': 'assets/images/img.png', 'title': 'Calm Down', 'subtitle': 'Rema, Selena Gomez'},
//                       {'image': 'assets/images/khamoshiaa.jpg', 'title': 'Khamoshiya', 'subtitle': 'Sam Smith, Kim Petras'},
//                       {'image': 'assets/images/aa.jpg', 'title': 'Another Album', 'subtitle': 'Another Artist'},
//                       {'image': 'assets/images/toba.jpg', 'title': 'Taoba Touba', 'subtitle': 'Karan Aujla (NewsBad)'},
//                       {'image': 'assets/images/animal.jpg', 'title': 'Pahle Bhi Main', 'subtitle': 'Vishal Misra, (Animal)'},
//                       {'image': 'assets/images/hiriye.jpg', 'title': 'Hiriye Hiriye', 'subtitle': 'Another Artist'},
//                       {'image': 'assets/images/img.png', 'title': 'Calm Down', 'subtitle': 'Rema, Selena Gomez'},
//                       {'image': 'assets/images/khamoshiaa.jpg', 'title': 'Khamoshiya', 'subtitle': 'Sam Smith, Kim Petras'},
//                       {'image': 'assets/images/aa.jpg', 'title': 'Another Album', 'subtitle': 'Another Artist'},
//                     ]),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       // Uncomment if needed
//       // bottomNavigationBar: Container(
//       //   color: Colors.black,
//       //   child: BottomNavigationBar(
//       //     backgroundColor: Colors.black,
//       //     unselectedItemColor: Colors.black,
//       //     selectedItemColor: Colors.green,
//       //     items: [
//       //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//       //       BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: 'Explore'),
//       //       BottomNavigationBarItem(icon: Icon(Icons.youtube_searched_for_sharp), label: 'YouTube Search'),
//       //       BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Library'),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
//
//   Widget _buildDrawerItem(BuildContext context, String title, IconData icon, Widget page) {
//     return ListTile(
//       title: InkWell(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => page));
//         },
//         child: Text(title, style: TextStyle(color: Colors.white)),
//       ),
//       leading: Icon(icon, color: Colors.white),
//     );
//   }
//
//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: TextStyle(
//           color: Colors.green,
//           fontSize: 20,
//           fontWeight: FontWeight.bold),
//     );
//   }
//
//   Widget _buildTrendingList(BuildContext context, List<Map<String, String>> items) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: items.map((item) {
//           return _buildTrendingCard(context, item['image']!, item['title']!, item['subtitle']!);
//         }).toList(),
//       ),
//     );
//   }
//
//   Widget _buildTrendingCard(BuildContext context, String imagePath, String title, String subtitle) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10.0),
//       child: Stack(
//         children: [
//           Container(
//             width: 150,
//             height: 150,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               image: DecorationImage(
//                 image: AssetImage(imagePath),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 8,
//             right: 8,
//             child: InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MusicPlayerPage(
//                       //  title: title,
//                       //  subtitle: subtitle,
//                     ),
//                   ),
//                 );
//                 print('Play $title');
//               },
//               child: Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.red.withOpacity(0.7),
//                 ),
//                 child: Icon(Icons.play_arrow, color: Colors.white),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: EdgeInsets.all(8),
//               color: Colors.black.withOpacity(0.5),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                         color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     subtitle,
//                     style: TextStyle(color: Colors.white54, fontSize: 14),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
