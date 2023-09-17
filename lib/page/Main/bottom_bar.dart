import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MainPages/HomePage.dart';
import 'MainPages/Idea_page.dart';
import 'MainPages/Likes_page.dart';
import 'MainPages/Search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      const HomePage(),
      const SearchPage(),
      const LikesPage(),
      const IdeaPage(),
    ];
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(24))
          ),
          child: const Row(
            children: [
            ],
          )

          ),

      )
    );
  }
}
