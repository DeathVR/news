import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_rss/dart_rss.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/bloc/news_bloc.dart';
import 'package:news/ui/loaders/home_page_header_loader.dart';
import 'package:news/ui/pages/news_page.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AllNewsList extends StatelessWidget {
  const AllNewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is! NewsLoaded) {
          return const HomePageHeaderLoader();
        }
        final allNews = state.allNews.items;
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => AllNewsItem(
            newsItem: allNews[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: allNews.length,
        );
      },
    );
  }
}

class AllNewsItem extends StatelessWidget {
  final RssItem newsItem;
  const AllNewsItem({Key? key, required this.newsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      beginCurve: Curves.linear,
      endDuration: const Duration(milliseconds: 500),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsPage(item: newsItem),
          ),
        );
      },
      child: Container(
        height: 320,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: newsItem.enclosure!.url!,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              ),
            ),
            AllNewsText(
              title: newsItem.title!,
              data: newsItem.content!.value.replaceAll('<p>', ''),
            ),
          ],
        ),
      ),
    );
  }
}

class AllNewsText extends StatelessWidget {
  final String title;
  final String data;
  const AllNewsText({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            data,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const Text(
            '15.12.2004',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
