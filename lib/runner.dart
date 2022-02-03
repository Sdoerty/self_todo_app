import 'package:flutter/material.dart';
import 'package:self_todo/category_page.dart';
import 'package:self_todo/category_widgets/create_category_widget.dart';
import 'package:self_todo/task_widgets/create_task_widget.dart';
import 'package:self_todo/task_widgets/task_widget.dart';

class Runner extends StatelessWidget {
  const Runner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/category",
      routes: {
        "/category": (context) => const CategoryPage(),
        "/category/create_category": (context) => const CreateCategoryWidget(),
        "/category/tasks": (context) => const TaskWidget(),
        "/category/tasks/create_task": (context) => const CreateTaskWidget(),
      },
    );
  }
}
