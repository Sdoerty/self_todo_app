// personal template of InheritedWidget
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:self_todo/entity/category.dart';


class CreateCategoryModel{
  var categoryName = "";

  void save(BuildContext context) async{
    if(categoryName.isEmpty) return;
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(CategoryAdapter());
    }
    final box =  await Hive.openBox<Category>('category');
    final category = Category(name: categoryName);
    box.add(category);
    Navigator.of(context).pop();
  }
}

class CreateCategoryProvider extends InheritedWidget {
  final CreateCategoryModel model;

  const CreateCategoryProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

  // dependOnInheritedWidgetOfExactType - Получает инхерит и одновременно подписывается на его изменения
  static CreateCategoryProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CreateCategoryProvider>();
  }

  // dependOnInheritedWidgetOfExactType - Получает элемент инхерит виджета, из него можно получить сам инхерит без подписи на изменения
  static CreateCategoryProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<CreateCategoryProvider>()?.widget;
    return widget is CreateCategoryProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(CreateCategoryProvider oldWidget) {
    return true;
  }
}