import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:audioplayers/audioplayers.dart';

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

class MusicPlayerPage extends StatefulWidget {
  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  bool isFavorite = false;
  bool isPlaying = false;
  AudioPlayer _audioPlayer = AudioPlayer();
  int currentSongIndex = 0;

  List<Map<String, String>> songs = [
    {
      'title': 'Tauba Tauba',
      'artist': 'Karan Aujla',
      'album': 'Bad News',
      'image': 'assets/images/toba.jpg',
      'file': 'toba.mp3',
    },
    {
      'title': 'Snake',
      'artist': 'Unknown Artist',
      'album': 'Unknown Album',
      'image': 'assets/images/snak.jpg',
      'file': 'snak.mp3',
    },
    {
      'title': 'Brown',
      'artist': 'Honey Singh',
      'album': 'Honey Singh',
      'image': 'assets/images/bravan.jpg',
      'file': 'brown.mp3',
    },
  ];

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPauseAudio() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource(songs[currentSongIndex]['file']!));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _skipPrevious() {
    setState(() {
      if (currentSongIndex > 0) {
        currentSongIndex--;
      } else {
        currentSongIndex = songs.length - 1;
      }
    });
    _playAudio();
  }

  void _skipNext() {
    setState(() {
      if (currentSongIndex < songs.length - 1) {
        currentSongIndex++;
      } else {
        currentSongIndex = 0;
      }
    });
    _playAudio();
  }

  void _playAudio() async {
    if (isPlaying) {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(songs[currentSongIndex]['file']!));
    }
  }

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
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: () {
              final String text = 'Check out this awesome song!';
              Share.share(text, subject: 'Awesome Song');
            },
          ),
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
              return {'View Album', 'Add to Playlist', 'Sleep Timer', 'Search Video', 'Song Info'}
                  .map((String choice) {
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(songs[currentSongIndex]['image']!, height: 300, width: 220),
              ),
            ),
            SizedBox(height: 110),
            Text(
              songs[currentSongIndex]['title']!,
              style: TextStyle(color: Colors.pinkAccent, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '${songs[currentSongIndex]['artist']} • ${songs[currentSongIndex]['album']}',
              style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            Slider(
              value: 0.2,
              onChanged: (value) {},
              activeColor: Colors.pinkAccent,
              inactiveColor: Colors.blueGrey,
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
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_previous, color: Colors.white, size: 36),
                  onPressed: _skipPrevious,
                ),
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                    color: Colors.white,
                    size: 64,
                  ),
                  onPressed: _playPauseAudio,
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, color: Colors.white, size: 36),
                  onPressed: _skipNext,
                ),
                IconButton(
                  icon: Icon(Icons.shuffle, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            Spacer(),
            Text(
              '   ',
              style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
