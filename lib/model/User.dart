// user_model.dart

import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String username;
  final String password;

  User({this.id, required this.username, required this.password});
}