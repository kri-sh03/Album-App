import 'package:album/API/api_call.dart';
import 'package:album/Screens/album_view.dart';
import 'package:album/Screens/post_screen.dart';
import 'package:album/Screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfileScreen(apiService: apiService)));
            },
          ),
          ListTile(
            title: Text('Albums'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AlbumsScreen(apiService: apiService)));
            },
          ),
          ListTile(
            title: Text('Posts'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PostsScreen(apiService: apiService)));
            },
          ),
        ],
      ),
    );
  }
}
