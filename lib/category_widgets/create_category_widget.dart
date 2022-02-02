import 'package:flutter/material.dart';
import 'package:self_todo/category_widgets/create_category_provider.dart';

class CreateCategoryWidget extends StatefulWidget {
  const CreateCategoryWidget({Key? key}) : super(key: key);

  @override
  State<CreateCategoryWidget> createState() => _CreateCategoryWidgetState();
}

class _CreateCategoryWidgetState extends State<CreateCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    final _model = CreateCategoryModel();

    return Scaffold(
      appBar: AppBar(
        title: Text('Создать категорию'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: CreateCategoryProvider(
              model: _model,
              child: TextField(
                onEditingComplete: () => _model.save(context),
                onChanged: (value) => _model.categoryName = value,
                autofocus: true,
                decoration: InputDecoration(
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _model.save(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
