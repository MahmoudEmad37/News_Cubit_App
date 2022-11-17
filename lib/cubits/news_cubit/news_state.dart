
import 'package:cubit_news_app/models/articles.dart';

abstract class NewsState{
  const NewsState();
}

class NewsInitial extends NewsState {}
class NewsLoading extends NewsState {}
class NewsSuccess extends NewsState {
  List<Articles> articles;
  NewsSuccess(this.articles);
}
class NewsFailure extends NewsState {}

