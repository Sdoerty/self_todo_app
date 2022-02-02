import 'package:flutter/material.dart';
import 'package:self_todo/category_page.dart';
import 'package:self_todo/category_widgets/create_category_widget.dart';

class Runner extends StatelessWidget {
  const Runner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const CategoryPage(),
        "/create_category": (context) => const CreateCategoryWidget(),
      },
    );
  }
}
