import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'spotify_service.dart';

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
