import 'package:flutter/material.dart';
import 'package:blueberry/src/navigation/home_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: ListView(
        children: const [
          SizedBox(height: 20.0),
          HomeBanner(
            title: 'Bienvenue Nicolas !',
            cookTime: 'cookTime',
            rating: 'rating',
            thumbnailUrl: 'assets/images/background.jpg',
          ),
          SizedBox(height: 20.0),
          SizedBox(height: 20.0),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
