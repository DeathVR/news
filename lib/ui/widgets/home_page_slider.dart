import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/bloc/news_bloc.dart';
import 'package:news/ui/loaders/home_page_slider_loaders.dart';

class HomePageSlider extends StatelessWidget {
  const HomePageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is! NewsLoaded) {
          return const NomePageSlidersLoaders();
        }
        final allNews = state.allNews.items;
        return CarouselSlider.builder(
          itemCount: allNews.length,
          itemBuilder: (context, index, realIndex) => SliderItem(
            newsItem: allNews[index],
          ),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            height: 200,
          ),
        );
      },
    );
  }
}

class SliderItem extends StatelessWidget {
  final RssItem newsItem;
  const SliderItem({Key? key, required this.newsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 400,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: newsItem.enclosure!.url!,
          progressIndicatorBuilder: (context, url, progress) => const Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );
  }
}

/*
Image.network(
        'https://klike.net/uploads/posts/2019-05/1556708032_1.jpg',
        fit: BoxFit.fill,
      ),


 */