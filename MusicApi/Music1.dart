import 'dart:convert';
import 'package:http/http.dart' as http;

class SpotifyService {
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
