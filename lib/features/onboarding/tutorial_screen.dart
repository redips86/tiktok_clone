import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showInPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails detail) {
    if (_direction == Direction.left) {
      setState(() {
        _showInPage = Page.second;
      });
    } else {
      setState(() {
        _showInPage = Page.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v36,
                  Text("Watch cool videos!",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      )),
                  Gaps.v20,
                  Text(
                    "Videos are personalized for you based on what you watch, like, and share.",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  ),
                ],
              ),
              secondChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v36,
                  Text("Follow the rules!",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      )),
                  Gaps.v20,
                  Text(
                    "Take care of one another! Please!",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                    ),
                  ),
                ],
              ),
              crossFadeState: (_showInPage == Page.first)
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size24,
              horizontal: Sizes.size24,
            ),
            child: AnimatedOpacity(
              opacity: _showInPage == Page.first ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: CupertinoButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {},
                child: const Text("Enter the app!"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
