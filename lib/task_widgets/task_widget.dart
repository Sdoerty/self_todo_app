import 'package:flutter/material.dart';
import 'package:self_todo/task_widgets/task_provider.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  TaskModel? _model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_model != null) {
      //получание именованого route с параметром (categoryKey получаем из метода showTasks)
      final categoryKey = ModalRoute.of(context)!.settings.arguments as int;
      _model = TaskModel(groupKey: categoryKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = _model;
    if (model != null) {
      return TaskWidgetProvider(model: model, child: const TaskWidgetBody());
    } else {
      return const Center(child: Text("aa"));
    }
  }
}

class TaskWidgetBody extends StatelessWidget {
  const TaskWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('aa'),
    );
  }
}
