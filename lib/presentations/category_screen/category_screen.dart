import 'package:cubit_news_app/constant.dart';
import 'package:cubit_news_app/cubits/news_cubit/news_cubit.dart';
import 'package:cubit_news_app/cubits/news_cubit/news_state.dart';
import 'package:cubit_news_app/cubits/theme_cubit/theme_cubit.dart';
import 'package:cubit_news_app/presentations/widgets/card_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/theme_cubit/theme_state.dart';

class CategoryScreen extends StatelessWidget {
  String category;

  CategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$category News',
                    style: const TextStyle(fontSize: fontxlarge),
                  ),
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<ThemeCubit>(context).changeTheme();
                      },
                      icon: BlocProvider.of<ThemeCubit>(context).state is ThemeLight
                          ? const Icon(
                              Icons.dark_mode,
                            )
                          : const Icon(
                              Icons.light_mode,
                            ))
                ],
              ),
            ),
            const CategoryBody(),
          ],
        ),
      ),
    );
  }
}

class CategoryBody extends StatelessWidget {
  const CategoryBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsSuccess) {
            return ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: CardNews(
                      text: state.articles[index].title,
                      imageUrl: state.articles[index].urlToImage,
                      link: state.articles[index].url,
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text('Something went wrong please try again'),
            );
          }
        },
      ),
    );
  }
}
