import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Library',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: LibraryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Library'),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.black12),
                child: Column(
                  children: [
                    Text(
                      '\n My Music App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('Home', style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.home, color: Colors.white),
              ),
              ListTile(
                title: Text('My Music', style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.library_music, color: Colors.white),
              ),
              ListTile(
                title: Text('Downloads', style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.file_download_done, color: Colors.white),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DownloadsPage()),
                  );
                },
              ),
              ListTile(
                title: Text('Playlist', style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.playlist_play_sharp, color: Colors.white),
              ),
              ListTile(
                title: Text('Setting', style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.settings, color: Colors.white),
              ),
              ListTile(
                title: Text('About', style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.info, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          _buildListTile(Icons.play_circle_filled, 'Now Playing', context),
          _buildListTile(Icons.history, 'Last Session', context),
          _buildListTile(Icons.favorite, 'Favorites', context),
          _buildListTile(Icons.library_music, 'My Music', context),
          _buildListTile(Icons.download, 'Downloads', context),
          _buildListTile(Icons.playlist_play, 'Playlists', context),
          _buildListTile(Icons.show_chart, 'Stats', context),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        if (icon == Icons.play_circle_filled) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NowPlayingScreen()),
          );
        } else if (icon == Icons.history) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LastSessionScreen()),
          );
        } else if (icon == Icons.favorite) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoriteSongsPage()),
          );
        } else if (icon == Icons.download) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DownloadsPage()),
          );
        }
        // Handle other navigation cases here
      },
    );
  }
}

class DownloadsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Downloads'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          TabBarSection(),
          Expanded(
            child: Center(
              child: Text(
                'Nothing to\nShow Here\n\nGo and Add Something',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Songs'),
              Tab(text: 'Albums'),
              Tab(text: 'Artists'),
              Tab(text: 'Playlist'),
            ],
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
          ),
          Container(
            height: 0.0,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class NowPlayingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/raz.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark overlay
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Now Playing',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // Album cover and song details
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Album cover
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/raz.jpg'), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                  SizedBox(width: 20),
                  // Song details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Main Agar Saamne',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Abhijeet, Alka Yagnik',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LastSessionScreen extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {
      "title": "Jitni Dafa",
      "artist": "Yasser Desai",
      "image": "assets/images/snak.jpg", // Replace with your image path
    },
    {
      "title": "Brown Rang",
      "artist": "Yo Yo Honey Singh",
      "image": "assets/images/bravan.jpg", // Replace with your image path
    },
    {
      "title": "Main Agar Saamne",
      "artist": "Abhijeet, Alka Yagnik",
      "image": "assets/images/raz.jpg", // Replace with your image path
    },
    {
      "title": "Jo Bhi Kasmein",
      "artist": "Alka Yagnik, Udit Narayan",
      "image": "assets/images/raz.jpg", // Replace with your image path
    },
    {
      "title": "Jitni Dafa",
      "artist": "Yasser Desai",
      "image": "assets/images/snak.jpg", // Replace with your image path
    },
    {
      "title": "Brown Rang",
      "artist": "Yo Yo Honey Singh",
      "image": "assets/images/bravan.jpg", // Replace with your image path
    },
    {
      "title": "Main Agar Saamne",
      "artist": "Abhijeet, Alka Yagnik",
      "image": "assets/images/raz.jpg", // Replace with your image path
    },
    {
      "title": "Jo Bhi Kasmein",
      "artist": "Alka Yagnik, Udit Narayan",
      "image": "assets/images/raz.jpg", // Replace with your image path
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Last Session'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options press
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            leading: Image.asset(
              song['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(
              song['title']!,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              song['artist']!,
              style: TextStyle(color: Colors.white70),
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}

class FavoriteSongsPage extends StatelessWidget {
  final List<Song> songs = [
    Song('Brown Rang', 'Yo Yo Honey Singh - International Villager', 'assets/images/bravan.jpg'),
    Song('Jitni Dafa', 'Yasser Desai - Parmanu', 'assets/images/snak.jpg'),
    Song('Pehle Bhi Main', 'Vishal Mishra, Raj Shekhar - Animal', 'assets/images/raz.jpg'),
    Song('Tum Se', 'Varun Jain, Raghav Chaitanya - Batti Gul Meter Chalu', 'assets/images/snak.jpg'),
    Song('Thoda Thoda Pyaar', 'Stebin Ben, Nilesh Ahuja', 'assets/images/bravan.jpg'),
    Song('Raanjhana Ve', 'Soham Naik, Antara Mitra', 'assets/images/raz.jpg'),

    Song('Brown Rang', 'Yo Yo Honey Singh - International Villager', 'assets/images/bravan.jpg'),
    Song('Jitni Dafa', 'Yasser Desai - Parmanu', 'assets/images/snak.jpg'),
    Song('Pehle Bhi Main', 'Vishal Mishra, Raj Shekhar - Animal', 'assets/images/raz.jpg'),
    Song('Tum Se', 'Varun Jain, Raghav Chaitanya - Batti Gul Meter Chalu', 'assets/images/snak.jpg'),
    Song('Thoda Thoda Pyaar', 'Stebin Ben, Nilesh Ahuja', 'assets/images/bravan.jpg'),
    Song('Raanjhana Ve', 'Soham Naik, Antara Mitra', 'assets/images/raz.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Songs'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            leading: Image.asset(song.imagePath, width: 50, height: 50),
            title: Text(song.title),
            subtitle: Text(song.artist),
            trailing: Icon(Icons.download),
          );
        },
      ),
    );
  }
}

class Song {
  final String title;
  final String artist;
  final String imagePath;

  Song(this.title, this.artist, this.imagePath);
}
