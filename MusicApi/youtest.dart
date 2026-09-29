// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:practice/Coding%20Age%20Project/About.dart';
// import 'package:practice/Coding%20Age%20Project/Downloads.dart';
// import 'package:practice/Coding%20Age%20Project/MyMusic.dart';
// import 'package:practice/Coding%20Age%20Project/PlayList.dart';
// import 'package:practice/Coding%20Age%20Project/page1.dart';
// import 'package:practice/Coding%20Age%20Project/setting.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage2(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class HomePage2 extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage2> {
//   final PageController _pageController = PageController();
//   int _currentPage = 0;
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     _startAutoPlay();
//   }
//   void _startAutoPlay() {
//     _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
//       if (_currentPage < 6) { // Updated to match the number of images
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }
//
//       _pageController.animateToPage(
//         _currentPage,
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeIn,
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black12,
//         iconTheme: IconThemeData(color: Colors.white),
//         title: Container(
//           height: 50,
//           decoration: BoxDecoration(
//             color: Colors.black26,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: TextField(
//             decoration: InputDecoration(
//               hintText: 'Songs, albums or artists',
//               hintStyle: TextStyle(color: Colors.white54),
//               prefixIcon: Icon(Icons.search, color: Colors.green),
//               filled: true,
//               fillColor: Colors.grey[900],
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
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
//                   ListTile(
//                     title: InkWell(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage22()));
//                       },
//                       child: Text('Home', style: TextStyle(color: Colors.white)),
//                     ),
//                     leading: Icon(Icons.home, color: Colors.white),
//                   ),
//                   ListTile(
//                     title: InkWell(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => MyMusicPage()));
//                       },
//                       child: Text('My Music', style: TextStyle(color: Colors.white)),
//                     ),
//                     leading: Icon(Icons.library_music, color: Colors.white),
//                   ),
//                   ListTile(
//                     title: InkWell(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => DownloadsPage()));
//                       },
//                       child: Text('Downloads', style: TextStyle(color: Colors.white)),
//                     ),
//                     leading: Icon(Icons.file_download_done, color: Colors.white),
//                   ),
//                   ListTile(
//                     title: InkWell(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistPage()));
//                       },
//                       child: Text('Playlist', style: TextStyle(color: Colors.white)),
//                     ),
//                     leading: Icon(Icons.playlist_play_sharp, color: Colors.white),
//                   ),
//                   ListTile(
//                     title: InkWell(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
//                       },
//                       child: Text('Setting', style: TextStyle(color: Colors.white)),
//                     ),
//                     leading: Icon(Icons.settings, color: Colors.white),
//                   ),
//                   ListTile(
//                     title: InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
//                         },
//                         child: Text('About', style: TextStyle(color: Colors.white))),
//                     leading: Icon(Icons.info, color: Colors.white),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image carousel
//             Container(
//               height: 220,
//               child: PageView(
//                 controller: _pageController,
//                 children: [
//                   Image.asset('assets/images/bro.jpg', fit: BoxFit.cover),
//                   Image.asset('assets/images/ajay.jpg', fit: BoxFit.cover),
//                   Image.asset('assets/images/pad.jpg', fit: BoxFit.cover),
//                   Image.asset('assets/images/pic1.jpg', fit: BoxFit.cover),
//                   Image.asset('assets/images/pic2.jpg', fit: BoxFit.cover),
//                   Image.asset('assets/images/pic3.jpg', fit: BoxFit.cover),
//                   Image.asset('assets/images/pic1.jpg', fit: BoxFit.cover),
//                 ],
//               ),
//             ),
//             // Trending Now
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 20),
//                   Text(
//                     'Trending Now',
//                     style: TextStyle(
//                         color: Colors.green,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         _buildTrendingCard('assets/images/toba.jpg', 'Taoba Touba',
//                             'Karan Aujla (NewsBad) '),
//                         _buildTrendingCard('assets/images/tumse.jpg', 'Tum Se',
//                             'VArun Jain Album'),
//                         _buildTrendingCard('assets/images/bravan.jpg', 'Brown Rang',
//                             'Yo Yo Honey Singh'),
//                         _buildTrendingCard('assets/images/snak.jpg', 'Suna Hai',
//                             'Jubin Nautiyal'),
//                         _buildTrendingCard('assets/images/animal.jpg', 'Pahle Bhi Main',
//                             'Vishal Misra, (Animal)'),
//                         _buildTrendingCard('assets/images/pic3.jpg', 'Another Album',
//                             'Another Artist'),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 18),
//                   Text(
//                     'Top Charts',
//                     style: TextStyle(
//                         color: Colors.green,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         _buildTrendingCard('assets/images/img.png', 'Calm Down',
//                             'Rema, Selena Gomez'),
//                         _buildTrendingCard('assets/images/pic1.jpg', 'Unholy',
//                             'Sam Smith, Kim Petras'),
//                         _buildTrendingCard('assets/images/pic3.jpg', 'Another Album',
//                             'Another Artist'),
//                         _buildTrendingCard('assets/images/img.png', 'Calm Down',
//                             'Rema, Selena Gomez'),
//                         _buildTrendingCard('assets/images/pic1.jpg', 'Unholy',
//                             'Sam Smith, Kim Petras'),
//                         _buildTrendingCard('assets/images/pic3.jpg', 'Another Album',
//                             'Another Artist'),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 18),
//                   Text(
//                     'New Release',
//                     style: TextStyle(
//                         color: Colors.green,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         _buildTrendingCard('assets/images/toba.jpg', 'Taoba Touba',
//                             'Karan Aujla (NewsBad) '),
//                         _buildTrendingCard('assets/images/animal.jpg', 'Pahle Bhi Main',
//                             'Vishal Misra, (Animal)'),
//                         _buildTrendingCard('assets/images/hiriye.jpg', 'Hiriye Hiriye',
//                             'Another Artist'),
//                         _buildTrendingCard('assets/images/img.png', 'Calm Down',
//                             'Rema, Selena Gomez'),
//                         _buildTrendingCard('assets/images/khamoshiaa.jpg', 'Khamoshiya ',
//                             'Sam Smith, Kim Petras'),
//                         _buildTrendingCard('assets/images/aa.jpg', 'Another Album',
//                             'Another Artist'),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 18),
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Text('Charts', style: TextStyle(color: Colors.green, fontSize: 20,fontWeight: FontWeight.bold)),
//                   ),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         ChartItem(imageUrl: 'assets/images/pic1.jpg', title: 'Global Top 50', songCount: 50),
//                         ChartItem(imageUrl: 'assets/images/pic2.jpg', title: 'India Top 20', songCount: 20),
//                         ChartItem(imageUrl: 'assets/images/pic3.jpg', title: 'US Top 50', songCount: 50),
//                         ChartItem(imageUrl: 'assets/images/pic1.jpg', title: 'UK Top 40', songCount: 40),
//                       ],
//                     ),
//                   ),
//
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('Top Trending Videos', style: TextStyle(color: Colors.green, fontSize: 20,fontWeight: FontWeight.bold)),
//                   ),
//                   Container(
//                     height: 220,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         MusicVideoItem(imageUrl: 'assets/images/pic1.jpg', title: 'Trending Video 1'),
//                         MusicVideoItem(imageUrl: 'assets/images/pic2.jpg', title: 'Trending Video 2'),
//                         MusicVideoItem(imageUrl: 'assets/images/pic3.jpg', title: 'Trending Video 3'),
//                         MusicVideoItem(imageUrl: 'assets/images/pic1.jpg', title: 'Trending Video 4'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTrendingCard(String imageUrl, String title, String subtitle) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Image.asset(imageUrl, width: 100, height: 100),
//           Text(title, style: TextStyle(color: Colors.white)),
//           Text(subtitle, style: TextStyle(color: Colors.white54)),
//         ],
//       ),
//     );
//   }
// }
//
// class ChartItem extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final int songCount;
//
//   ChartItem({required this.imageUrl, required this.title, required this.songCount});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Image.asset(imageUrl, width: 100, height: 100),
//           Text(title, style: TextStyle(color: Colors.white)),
//           Text('$songCount songs', style: TextStyle(color: Colors.white54)),
//         ],
//       ),
//     );
//   }
// }
//
// class MusicVideoItem extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//
//   MusicVideoItem({required this.imageUrl, required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Image.asset(imageUrl, width: 100, height: 100),
//           Text(title, style: TextStyle(color: Colors.white)),
//         ],
//       ),
//     );
//   }
// }
