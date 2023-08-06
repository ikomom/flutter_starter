import 'package:flutter/material.dart';
import 'package:flutter_starter/what_app/common/routes/routes.dart';

class ChatHomePage extends StatelessWidget {
  const ChatHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Chat Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.contact);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
