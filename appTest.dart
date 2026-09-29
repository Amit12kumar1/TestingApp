import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MusicPlayerPage(),
      debugShowCheckedModeBanner: false,
    );
  }

  Icon _getIcon(String choice) {
    switch (choice) {
      case 'View Album':
        return Icon(Icons.album);
      case 'Add to Playlist':
        return Icon(Icons.playlist_add);
      case 'Sleep Timer':
        return Icon(Icons.timer);
      case 'Search Video':
        return Icon(Icons.youtube_searched_for);
      case 'Song Info':
        return Icon(Icons.info);
      default:
        return Icon(Icons.help);
    }
  }
}

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.expand_more, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              switch (value) {
                case 'View Album':
                  print('View Album selected');
                  break;
                case 'Add to Playlist':
                  print('Add to Playlist selected');
                  break;
                case 'Sleep Timer':
                  print('Sleep Timer selected');
                  break;
                case 'Search Video':
                  print('Search Video selected');
                  break;
                case 'Song Info':
                  print('Song Info selected');
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'View Album', 'Add to Playlist', 'Sleep Timer', 'Search Video', 'Song Info'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: ListTile(
                    leading: MyApp()._getIcon(choice),
                    title: Text(choice),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset('baba.jpg', width: 800, height: 850),
            ),
          ),
          SizedBox(height: 350),
          Text(
            'Stay With Me',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Chanyeol, Punch • Guardian, Pt. 1 (Original Te...',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          SizedBox(height: 25),
          Slider(
            value: 0.2,
            onChanged: (value) {},
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('00:14', style: TextStyle(color: Colors.white)),
                Text('03:12', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.skip_previous, color: Colors.white, size: 36),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.play_circle_filled, color: Colors.white, size: 64),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.skip_next, color: Colors.white, size: 36),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shuffle, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          Spacer(),
          Text(
            'Up Next',
            style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
