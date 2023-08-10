import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
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

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController =
      TextEditingController(text: "init text");

  void _onSearchChagned(String value) {
    print("Search value $value");
  }

  void _onSearchSubmitted(String value) {
    print("Submitted value $value");
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 1,
            centerTitle: true,
            title: CupertinoSearchTextField(
              controller: _textEditingController,
              onChanged: _onSearchChagned,
              onSubmitted: _onSearchSubmitted,
            ),
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
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 20,
                padding: const EdgeInsets.all(Sizes.size6),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.size10,
                  mainAxisSpacing: Sizes.size10,
                  childAspectRatio: 9 / 21,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.size4)),
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholderFit: BoxFit.cover,
                          placeholder: 'assets/images/placeholder.jpg',
                          image:
                              'https://source.unsplash.com/random/200x${355 + index}',
                        ),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      "This is a very long caption for my tiktok that i'm upload just now currently!",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Sizes.size16 + Sizes.size2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v5,
                    DefaultTextStyle(
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w600),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 30,
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              foregroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/104882161?v=4",
                              ),
                            ),
                          ),
                          Gaps.h4,
                          const Expanded(
                            child: Text(
                              "My avatar is too long long long!!!",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gaps.h4,
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size16,
                            color: Colors.grey.shade500,
                          ),
                          Gaps.h2,
                          const Text(
                            "2.5M",
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              for (var tab in tabs.skip(1))
                Center(
                  child: Text(
                    tab,
                    style: const TextStyle(
                      fontSize: Sizes.size28,
                    ),
                  ),
                )
            ],
          )),
    );
  }
}
