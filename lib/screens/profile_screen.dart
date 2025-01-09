import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        title: const Text("Profile"), 
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(''), 
              backgroundColor: Colors.grey[300], 
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Video preference",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: const Text("Download Option"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text("Video playback options"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
            },
          ),
          const SizedBox(height: 20),
          const Text(
            "Account Settings",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: const Text("Account Security"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text("Email Notification Preferences"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text("Learning Reminders"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
            },
          ),
          const SizedBox(height: 20),
          const Text(
            "Account Settings",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: const Text("About Learnout"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text("Frequently Asked Questions"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text("Share the Learnout App"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: TextButton(
              onPressed: () {
                _logout(context);
              },
              child: const Text(
                "Log Out",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/welcome');
  }
}