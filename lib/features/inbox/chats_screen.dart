import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  final List<int> _items = [];

  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(_items.length,
          duration: const Duration(milliseconds: 500));
      _items.add(_items.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Direct message"),
          elevation: 1,
          actions: [
            IconButton(
              onPressed: _addItem,
              icon: const FaIcon(FontAwesomeIcons.plus),
            )
          ],
        ),
        body: AnimatedList(
          key: _key,
          padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
          itemBuilder:
              (BuildContext context, int index, Animation<double> animation) {
            return FadeTransition(
              key: UniqueKey(),
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: ListTile(
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
                      Text(
                        'silk ($index)',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text("2:16 PM",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: Sizes.size14,
                          ))
                    ],
                  ),
                  subtitle: const Text("한글도 되나?"),
                ),
              ),
            );
          },
        ));
  }
}
