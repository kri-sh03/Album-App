// lib/screens/profile_screen.dart

import 'package:album/API/api_call.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final ApiService apiService;

  ProfileScreen({required this.apiService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: FutureBuilder(
        future: apiService.fetchProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final profile = snapshot.data as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Name: ${profile['name']}'),
                  Text('Email: ${profile['email']}'),
                  Text('Phone: ${profile['phone']}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
