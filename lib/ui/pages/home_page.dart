import 'package:flutter/material.dart';

import 'package:news/ui/widgets/all_news_list.dart';

import 'package:news/ui/widgets/home_page_app_bar.dart';
import 'package:news/ui/widgets/home_page_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const HomePageAppBar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 24),
                children: const [
                  HomePageSlider(),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Все новости',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff4149e8),
                      ),
                    ),
                  ),
                  AllNewsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

