import 'package:hive/hive.dart';
part 'categories.g.dart';

@HiveType(typeId: 1)
enum Categories {
  @HiveField(0)
  food,
  @HiveField(1)
  travel,
  @HiveField(2)
  entertainment,
  @HiveField(3)
  health,
  @HiveField(4)
  others
}
