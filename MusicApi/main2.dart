import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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

    print('Token response status: ${response.statusCode}');
    print('Token response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _token = data['access_token'];
      notifyListeners();
    } else {
      throw Exception('Failed to get token: ${response.body}');
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

    print('Music response status: ${response.statusCode}');
    print('Music response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['albums']['items'];
    } else {
      throw Exception('Failed to load trending music: ${response.body}');
    }
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
            return ListView.builder(
              itemCount: music.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(music[index]['images'][0]['url']),
                  title: Text(music[index]['name']),
                  subtitle: Text(music[index]['artists'][0]['name']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
