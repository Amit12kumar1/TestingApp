import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SpotifyService with ChangeNotifier {
  final String _clientId = 'YOUR_CLIENT_ID';
  final String _clientSecret = 'YOUR_CLIENT_SECRET';
  String _token = '';

  Future<void> _getToken() async {
    final response = await http.post(
      Uri.parse('https://accounts.spotify.com/api/token'),
      headers: {
        'Authorization': 'Basic ' + base64Encode(utf8.encode('$_clientId:$_clientSecret')),
      },
      body: {
        'grant_type': 'client_credentials',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _token = data['access_token'];
    } else {
      throw Exception('Failed to get token');
    }
  }

  Future<List<dynamic>> fetchTrendingMusic() async {
    if (_token.isEmpty) {
      await _getToken();
    }

    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/browse/new-releases'),
      headers: {
        'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['albums']['items'];
    } else {
      throw Exception('Failed to load trending music');
    }
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SpotifyService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrendingMusicScreen(),
    );
  }
}

class TrendingMusicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spotifyService = Provider.of<SpotifyService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Trending Music')),
      body: FutureBuilder(
        future: spotifyService.fetchTrendingMusic(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final music = snapshot.data as List<dynamic>;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              itemCount: music.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(music[index]['images'][0]['url']),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(music[index]['name']),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(music[index]['artists'][0]['name']),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
