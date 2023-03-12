import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/bloc/news_bloc.dart';
import 'package:news/ui/loaders/home_page_app_loader.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NewsBloc>(context);
    return Container(
      alignment: Alignment.center,
      height: 64,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(0, 0, 0, .3),
          ),
        ),
      ),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is! NewsLoaded) {
            return const HomePageAppBarLoader();
          }
          return Row(
            children: [
              FloatingActionButton(
                onPressed: () {
                  bloc.add(ChangeLangEvent(lang: 'en', context: context));
                },
                elevation: 0,
                highlightElevation: 0,
                backgroundColor: Colors.transparent,
                child: const Text('en'),
              ),
              FloatingActionButton(
                onPressed: () {
                  bloc.add(ChangeLangEvent(lang: 'ru', context: context));
                },
                elevation: 0,
                highlightElevation: 0,
                backgroundColor: Colors.transparent,
                child: const Text('ru'),
              ),
              FloatingActionButton(
                onPressed: () {
                  bloc.add(ChangeLangEvent(lang: 'uz', context: context));
                },
                elevation: 0,
                highlightElevation: 0,
                backgroundColor: Colors.transparent,
                child: const Text('uz'),
              ),
              Text(
                tr('title'),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4149e8),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
