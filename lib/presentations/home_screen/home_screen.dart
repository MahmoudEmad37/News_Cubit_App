import 'package:cubit_news_app/constant.dart';
import 'package:cubit_news_app/cubits/news_cubit/news_cubit.dart';
import 'package:cubit_news_app/cubits/news_cubit/news_state.dart';
import 'package:cubit_news_app/cubits/theme_cubit/theme_cubit.dart';
import 'package:cubit_news_app/presentations/widgets/card_news.dart';
import 'package:cubit_news_app/presentations/widgets/categories_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/theme_cubit/theme_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsCubit>(context).getNews();

    return Scaffold(
      //backgroundColor: backGround,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            FirstAppBar(),
            CategoriesBar(),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                'Best News',
                style: TextStyle( fontSize: fontlarge),
              ),
            ),
            NewsList()
          ],
        ),
      ),
    );
  }
}

class FirstAppBar extends StatelessWidget {
  const FirstAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 15.0, top: 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Choose News Categories",
            style: TextStyle(
                fontSize: fontlarge,
                fontWeight: FontWeight.w500),
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
    );
  }
}

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 14,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoriesButton(color: blue, text: "General"),
          CategoriesButton(color: orangeDark, text: "Science"),
          CategoriesButton(color: green, text: "Business"),
          CategoriesButton(color: orangeLight, text: "Health"),
          CategoriesButton(color: red, text: "Sports"),
          CategoriesButton(color: yellow, text: "Technology"),
          CategoriesButton(color: brown, text: "Entertainment"),
        ],
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
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
      }),
    );
  }
}
