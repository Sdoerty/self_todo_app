import 'package:hive/hive.dart';
part 'category.g.dart';

@HiveType(typeId: 1)
class Category{

  @HiveField(0)
  String name;
  
  @HiveField(1)
  HiveList? tasks;

  Category ({required this.name});
}