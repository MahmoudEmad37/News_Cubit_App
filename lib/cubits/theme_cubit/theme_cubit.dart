import 'package:bloc/bloc.dart';
import 'package:cubit_news_app/cubits/theme_cubit/theme_state.dart';

import '../../constant.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeLight(themeData: lightTheme));

  void changeTheme() {
    if (state is ThemeLight) {
      emit(ThemeDark(themeData: darkTheme));
    } else {
      emit(ThemeLight(themeData: lightTheme));
    }
  }
}
