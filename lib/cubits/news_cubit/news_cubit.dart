import 'package:bloc/bloc.dart';
import 'package:cubit_news_app/Services/api.dart';
import 'package:cubit_news_app/cubits/news_cubit/news_state.dart';
import 'package:cubit_news_app/models/articles.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.api) : super(NewsInitial());
  API api;
  List<Articles>? articles;

  void getNews() async {
    emit(NewsLoading());
    try {
      articles?.clear();
      articles = await api.fetchNews();
      emit(NewsSuccess(articles!));
    } on Exception catch (e) {
      emit(NewsFailure());
    }
  }

  void getCategoryNews(String categoryName) async {
    emit(NewsLoading());
    try {
      articles?.clear();
      articles = await api.fetchCategoriesNews(categoryName);
      emit(NewsSuccess(articles!));
    } on Exception catch (e) {
      emit(NewsFailure());
    }
  }
}
