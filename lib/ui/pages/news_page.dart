import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:news/ui/widgets/home_page_app_bar.dart';

class NewsPage extends StatelessWidget {
  final RssItem item;
  const NewsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const HomePageAppBar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(height: 16),
                  Text(
                    item.title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CachedNetworkImage(
                    imageUrl: item.enclosure!.url!,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    item.content!.value.replaceAll('<p>', ''),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Перейти к новости'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
