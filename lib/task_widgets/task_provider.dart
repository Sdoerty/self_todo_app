import 'package:flutter/cupertino.dart';

class TaskModel extends ChangeNotifier{
  int groupKey;

  TaskModel({required this.groupKey});
}

// personal template of InheritedWidget

class TaskWidgetProvider extends InheritedNotifier {
  final TaskModel model;
  const TaskWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  // dependOnInheritedWidgetOfExactType - Получает инхерит и одновременно подписывается на его изменения
  static TaskWidgetProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskWidgetProvider>();
  }

  // dependOnInheritedWidgetOfExactType - Получает элемент инхерит виджета, из него можно получить сам инхерит без подписи на изменения
  static TaskWidgetProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<TaskWidgetProvider>()?.widget;
    return widget is TaskWidgetProvider ? widget : null;
  }

}