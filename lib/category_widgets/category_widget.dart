import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:self_todo/category_widgets/category_provider.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final _model = CategoryWidgetModel();

  @override
  Widget build(BuildContext context) {
    return CategoryWidgetProvider(
        model: _model, child: CategoryDisplayWidget());
  }
}

class CategoryDisplayWidget extends StatelessWidget {
  const CategoryDisplayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Категории'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: _CategoryFieldWidget(),
      ),
      floatingActionButton: const CreateCategoryFloatingActionButtonWidget(),
    );
  }
}

class _CategoryFieldWidget extends StatelessWidget {
  const _CategoryFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = CategoryWidgetModel();
    final categoriesCount =
        CategoryWidgetProvider.watch(context)?.model.categories.length ?? 0;

    return ListView.separated(
        itemCount: categoriesCount,
        separatorBuilder: (BuildContext context, int index) => Divider(
              height: 1,
            ),
        itemBuilder: (BuildContext context, int index) {
          void delete_category() {
            _model.deleteCategory(index);
          }

          final category =
              CategoryWidgetProvider.read(context)?.model.categories[index];

          return Slidable(
              endActionPane: ActionPane(
                motion: BehindMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) => delete_category(),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: ListTile(
                title: Text(category!.name),
                trailing: Icon(Icons.arrow_right),
              ));
        });
  }
}

class CreateCategoryFloatingActionButtonWidget extends StatelessWidget {
  const CreateCategoryFloatingActionButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.indigo,
        onPressed: () =>
            CategoryWidgetProvider.read(context)?.model.showForm(context));
  }
}
