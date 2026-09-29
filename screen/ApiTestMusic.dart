import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage22(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage22 extends StatefulWidget {
  @override
  _HomePage22State createState() => _HomePage22State();
}

class _HomePage22State extends State<HomePage22> {
  List<Map<String, dynamic>> trendingSongs = [];
  List<Map<String, dynamic>> newReleases = [];
  List<Map<String, dynamic>> topCharts = [];

  @override
  void initState() {
    super.initState();
    fetchTrendingSongs();
    fetchNewReleases();
    fetchTopCharts();
  }

  Future<void> fetchTrendingSongs() async {
    try {
      final response = await http.get(Uri.parse('https://api.deezer.com/chart/0/tracks'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          trendingSongs = List<Map<String, dynamic>>.from(data['data']);
        });
      } else {
        throw Exception('Failed to load trending songs');
      }
    } catch (e) {
      print("Error fetching trending songs: $e");
    }
  }

  Future<void> fetchNewReleases() async {
    try {
      final response = await http.get(Uri.parse('https://api.deezer.com/chart/0/albums'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          newReleases = List<Map<String, dynamic>>.from(data['data']);
        });
      } else {
        throw Exception('Failed to load new releases');
      }
    } catch (e) {
      print("Error fetching new releases: $e");
    }
  }

  Future<void> fetchTopCharts() async {
    try {
      final response = await http.get(Uri.parse('https://api.deezer.com/chart'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          topCharts = List<Map<String, dynamic>>.from(data['tracks']['data']);
        });
      } else {
        throw Exception('Failed to load top charts');
      }
    } catch (e) {
      print("Error fetching top charts: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ListTile(
                    title: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage22()));
                      },
                      child: Text('Home', style: TextStyle(color: Colors.white)),
                    ),
                    leading: Icon(Icons.home, color: Colors.white),
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyMusicPage()));
                      },
                      child: Text('My Music', style: TextStyle(color: Colors.white)),
                    ),
                    leading: Icon(Icons.library_music, color: Colors.white),
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DownloadsPage()));
                      },
                      child: Text('Downloads', style: TextStyle(color: Colors.white)),
                    ),
                    leading: Icon(Icons.file_download_done, color: Colors.white),
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PlaylistPage()));
                      },
                      child: Text('Playlist', style: TextStyle(color: Colors.white)),
                    ),
                    leading: Icon(Icons.playlist_play_sharp, color: Colors.white),
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                      },
                      child: Text('Setting', style: TextStyle(color: Colors.white)),
                    ),
                    leading: Icon(Icons.settings, color: Colors.white),
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
                      },
                      child: Text('About', style: TextStyle(color: Colors.white)),
                    ),
                    leading: Icon(Icons.info, color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi There,',
                  style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Mr. Amit',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Songs, albums or artists',
                    hintStyle: TextStyle(color: Colors.white54),
                    prefixIcon: Icon(Icons.search, color: Colors.green),
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Trending Now',
                      style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: trendingSongs.map((song) {
                          return _buildPlaylistCard(
                            song['album']['cover_medium'],
                            song['title'],
                            song['artist']['name'],
                            song,
                            context,
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'New Releases',
                      style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: newReleases.map((album) {
                          return _buildPlaylistCard(
                            album['cover_medium'],
                            album['title'],
                            album['artist']['name'],
                            album,
                            context,
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Top Charts',
                      style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: topCharts.map((song) {
                          return _buildPlaylistCard(
                            song['album']['cover_medium'],
                            song['title'],
                            song['artist']['name'],
                            song,
                            context,
                          );
                        }).toList(),
                      ),
                    ),
                    // Add other sections here...
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaylistCard(String imagePath, String title, String subtitle, Map<String, dynamic> item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MusicPlayerPage(song: item),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class MusicPlayerPage extends StatefulWidget {
  final Map<String, dynamic> song;

  MusicPlayerPage({required this.song});

  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  List<Map<String, dynamic>> _playlist = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _loadPlaylist();
  }

  void _loadPlaylist() {
    _playlist = [widget.song];
    _currentIndex = 0;
    _playSong();
  }

  void _playSong() async {
    String url = _playlist[_currentIndex]['preview'];
    await _audioPlayer.play(UrlSource(url));
    setState(() {
      _isPlaying = true;
    });
  }

  void _pauseSong() async {
    await _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  void _nextSong() {
    if (_currentIndex < _playlist.length - 1) {
      _currentIndex++;
      _playSong();
    }
  }

  void _prevSong() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _playSong();
    }
  }

  void _shareSong() {
    Share.share('Check out this song: ${_playlist[_currentIndex]['link']}');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> currentSong = _playlist[_currentIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Now Playing', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: _shareSong,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              currentSong['album']['cover_medium'],
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
            Text(
              currentSong['title'],
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              currentSong['artist']['name'],
              style: TextStyle(color: Colors.white54, fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous, color: Colors.white, size: 36),
                  onPressed: _prevSong,
                ),
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                    color: Colors.white,
                    size: 64,
                  ),
                  onPressed: _isPlaying ? _pauseSong : _playSong,
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, color: Colors.white, size: 36),
                  onPressed: _nextSong,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyMusicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Music', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text('My Music Page', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class DownloadsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Downloads', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text('Downloads Page', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class PlaylistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Playlist', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text('Playlist Page', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Settings', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text('Settings Page', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('About', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text('About Page', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
