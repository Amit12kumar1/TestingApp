import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Use a mock API for demonstration purposes
const String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  Future<List<SongModel>> _fetchSongs() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => SongModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load songs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    leading: _getIcon(choice),
                    title: Text(choice),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
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
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                      },
                      child: Text('Home', style: TextStyle(color: Colors.white)),
                    ),
                    leading: Icon(Icons.home, color: Colors.white),
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: (){},
                      child: Text('My Music', style: TextStyle(color: Colors.white)),
                    ),
                    leading: Icon(Icons.library_music, color: Colors.white),
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: (){},
                      child: Text('Downloads', style: TextStyle(color: Colors.white)),
                    ),
                    leading: Icon(Icons.file_download_done, color: Colors.white),
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: (){},
                      child: Text('Playlist', style: TextStyle(color: Colors.white)),
                    ),
                    leading: Icon(Icons.playlist_play_sharp, color: Colors.white),
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: (){},
                      child: Text('Setting', style: TextStyle(color: Colors.white)),
                    ),
                    leading: Icon(Icons.settings, color: Colors.white),
                  ),
                  ListTile(
                    title: InkWell(
                      onTap: (){},
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
      body: FutureBuilder<List<SongModel>>(
        future: _fetchSongs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<SongModel> songs = snapshot.data!;
            return ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(songs[index].title, style: TextStyle(color: Colors.white)),
                  subtitle: Text(songs[index].body, style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerScreen(data: songs[index]),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
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

class PlayerScreen extends StatelessWidget {
  final SongModel data;

  PlayerScreen({required this.data});

  final PlayerController controller = Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 250,
              width: 250,
              child: Icon(Icons.music_note, size: 250),
            ),
            SizedBox(height: 20),
            Text(
              data.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              data.body,
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  onPressed: () {
                    // Add previous song functionality if needed
                  },
                ),
                Obx(() {
                  return IconButton(
                    icon: controller.isPlaying
                        ? Icon(Icons.pause)
                        : Icon(Icons.play_arrow),
                    onPressed: () {
                      if (controller.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play(data.url); // Ensure data.url is a valid audio URL
                      }
                    },
                  );
                }),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  onPressed: () {
                    // Add next song functionality if needed
                  },
                ),
              ],
            ),
            Obx(() {
              return Slider(
                value: controller.position,
                max: controller.duration,
                onChanged: (value) {
                  controller.changeDurationToSeconds(value.toInt());
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class PlayerController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  RxBool _isPlaying = false.obs;
  RxDouble _position = 0.0.obs;
  RxDouble _duration = 0.0.obs;

  bool get isPlaying => _isPlaying.value;
  double get position => _position.value;
  double get duration => _duration.value;

  PlayerController() {
    _audioPlayer.onPositionChanged.listen((p) {
      _position.value = p.inSeconds.toDouble();
    });
    _audioPlayer.onDurationChanged.listen((d) {
      _duration.value = d.inSeconds.toDouble();
    });
  }

  void play(String url) async {
    await _audioPlayer.play(UrlSource(url)); // Use correct play method
    _isPlaying.value = true;
  }

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying.value = false;
  }

  void changeDurationToSeconds(int seconds) async {
    await _audioPlayer.seek(Duration(seconds: seconds));
  }
}

// Define the SongModel class with a factory method for
// Define the SongModel class with a factory method for JSON deserialization
class SongModel {
  final int id;
  final String title;
  final String body;
  final String url;

  SongModel({
    required this.id,
    required this.title,
    required this.body,
    required this.url,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', // Replace with actual audio URL if available
    );
  }
}
