import 'package:flutter_mvvm/data/RoomDatabase.dart';
import 'package:flutter_mvvm/model/User.dart';

class UserRepository {
  final AppDatabase _database;

  UserRepository(this._database);

  Future<User> findUserByUsername(String username) =>
      _database.userDao!.findUserByUsername(username);

  Future<void> insertUser(User user) => _database.userDao!.insertUser(user);
}
