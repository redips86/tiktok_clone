import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            centerTitle: true,
            title: const Text("discover"),
            bottom: TabBar(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
                splashFactory: NoSplash.splashFactory,
                isScrollable: true,
                unselectedLabelColor: Colors.grey.shade500,
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                tabs: [
                  for (var tab in tabs)
                    Tab(
                      text: tab,
                    ),
                ]),
          ),
          body: TabBarView(
            children: [
              for (var tab in tabs)
                Center(
                  child: Text(
                    tab,
                    style: const TextStyle(fontSize: Sizes.size28),
                  ),
                )
            ],
          )),
    );
  }
}
