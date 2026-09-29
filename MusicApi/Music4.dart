import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Music1.dart';

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
