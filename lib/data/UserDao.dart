// user_dao.dart

import 'package:floor/floor.dart';
import 'package:flutter_mvvm/model/User.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User WHERE username = :username')
  Future<User> findUserByUsername(String username);

  @insert
  Future<void> insertUser(User user);
}
