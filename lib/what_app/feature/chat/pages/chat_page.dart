import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/what_app/common/models/user_model.dart';
import 'package:flutter_starter/what_app/common/widgets/custom_icon_button.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.username,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 3),
            Text(
              'last seen ${user.lastSeen} ago',
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.video_call,
          ),
          CustomIconButton(
            onTap: () {},
            icon: Icons.search,
          ),
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          ),
        ],
        leadingWidth: 80,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.arrow_back),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 16,
                  backgroundImage:
                      user.profileImageUrl.isNotEmpty ? CachedNetworkImageProvider(user.profileImageUrl) : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
