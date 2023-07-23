// app_database.dart

import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_mvvm/data/UserDao.dart';
import 'package:flutter_mvvm/model/User.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';

@Database(version: 1, entities: [User])
class AppDatabase extends FloorDatabase {
  UserDao? userDao;
}
