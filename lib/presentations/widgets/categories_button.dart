import 'package:cubit_news_app/constant.dart';
import 'package:cubit_news_app/cubits/news_cubit/news_cubit.dart';
import 'package:cubit_news_app/presentations/category_screen/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoriesButton extends StatelessWidget {
  Color color;
  String text;

  CategoriesButton({Key? key, required this.color,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2.5,vertical: 5.0),
      child: RaisedButton(
        onPressed: (){
          BlocProvider.of<NewsCubit>(context).getCategoryNews(text);
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return CategoryScreen(category: text!);
          }));
        },
        color: color,
        child: Text(text,style: const TextStyle(
          fontWeight: FontWeight.w800,color: white,
        ),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
