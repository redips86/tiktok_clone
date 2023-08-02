import 'package:flutter/material.dart';

import 'constants/gaps.dart';
import 'constants/sizes.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData(
          primaryColor: const Color(0xFFE9435A),
      ),
      home: const Padding(
        padding: EdgeInsets.all(Sizes.size14),
        child: Row(children: [
          Text("hello"),
          Gaps.h20,
          Text("hello"),
        ],),
      ),
    );
  }
}