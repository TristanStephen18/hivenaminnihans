import 'package:hive/hive.dart';

part 'data.g.dart';

@HiveType(typeId: 1)
class Data{
  @HiveField(0)
  String name;

  @HiveField(1)
  String address;

  @HiveField(2)
  String id;

  Data({
    required this.name,
    required this.address,
    required this.id
  });
}