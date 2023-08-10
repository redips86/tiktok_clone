import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Direct message"),
          elevation: 1,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.plus),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
          children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 30,
                foregroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/104882161?v=4",
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'silk',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text("2:16 PM",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: Sizes.size14,
                      ))
                ],
              ),
              subtitle: const Text("한글도 되나?"),
            )
          ],
        ));
  }
}
