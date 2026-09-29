import 'package:flutter/material.dart';

void main() {
  runApp(NDTVApp());
}

class NDTVApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NDTVHomePage(),
    );
  }
}

class NDTVHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('NDTV', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Text('WORLD', style: TextStyle(color: Colors.red)),
          ],
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            _buildMenu(),
            SizedBox(height: 10),
            _buildNewsSection(),
            SizedBox(height: 10),
            _buildOpinionSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Live TV', style: TextStyle(color: Colors.white)),
          Text('Latest', style: TextStyle(color: Colors.white)),
          Text('Video', style: TextStyle(color: Colors.white)),
          Text('Opinion', style: TextStyle(color: Colors.white)),
          Text('Diaspora', style: TextStyle(color: Colors.white)),
          Text('India', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildNewsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: _buildNewsCard(
              'Exciting To Watch: YouTube Chief As Chandrayaan-3 Breaks Viewing Record',
              'assets/chandrayaan.jpg', // Replace with your image path
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: _buildNewsCard(
              'Spanish Man Touches Reporter On Live TV, Arrested After Video Goes Viral',
              'assets/spanish_man.jpg', // Replace with your image path
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(String title, String imagePath) {
    return Card(
      child: Column(
        children: [
          Image.asset(imagePath, fit: BoxFit.cover, height: 100, width: double.infinity),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildOpinionSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Opinion', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          _buildOpinionCard(
            'Blog: India-China Ties Through The Eyes Of A Student',
            'assets/student.jpg', // Replace with your image path
          ),
          SizedBox(height: 10),
          _buildOpinionCard(
            'Opinion: African Union In G20 - Seismic Change Under Modi\'s Leadership',
            'assets/african_union.jpg', // Replace with your image path
          ),
        ],
      ),
    );
  }

  Widget _buildOpinionCard(String title, String imagePath) {
    return Card(
      child: ListTile(
        leading: Image.asset(imagePath, fit: BoxFit.cover, width: 50, height: 50),
        title: Text(title),
      ),
    );
  }
}