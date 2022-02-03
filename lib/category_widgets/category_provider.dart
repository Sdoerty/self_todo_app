import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:self_todo/entity/category.dart';

class CategoryWidgetModel extends ChangeNotifier {
  var _categories = <Category>[];

  List<Category> get categories => _categories.toList();

  CategoryWidgetModel() {
    setup();
  }

  void showForm(BuildContext context) {
    Navigator.pushNamed(context, '/category/create_category');
  }

  void showTasks(BuildContext context, int categoryIndex) async{
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CategoryAdapter());
    }
    final box = await Hive.openBox<Category>('category');
    final categoryKey = box.keyAt(categoryIndex) as int;

    Navigator.pushNamed(context, '/category/tasks', arguments: categoryKey);
  }

  void deleteCategory(int categoryIndex) async{
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CategoryAdapter());
    }
    final box = await Hive.openBox<Category>('category');
    await box.deleteAt(categoryIndex);
  }

  void readGroupsFromHive(Box<Category> box) {
    _categories = box.values.toList();
    notifyListeners();
  }

  void setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CategoryAdapter());
    }
    final box = await Hive.openBox<Category>('category');
    readGroupsFromHive(box);
    box.listenable().addListener(() => readGroupsFromHive(box));
  }
}

// personal template of InheritedWidget

class CategoryWidgetProvider extends InheritedNotifier {
  final CategoryWidgetModel model;

  const CategoryWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  // dependOnInheritedWidgetOfExactType - Получает инхерит и одновременно подписывается на его изменения
  static CategoryWidgetProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CategoryWidgetProvider>();
  }

  // dependOnInheritedWidgetOfExactType - Получает элемент инхерит виджета, из него можно получить сам инхерит без подписи на изменения
  static CategoryWidgetProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<CategoryWidgetProvider>()
        ?.widget;
    return widget is CategoryWidgetProvider ? widget : null;
  }
}
