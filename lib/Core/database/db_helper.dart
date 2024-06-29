import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  static Future initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "db.sqlite");

    final exist = await databaseExists(path);

    if (exist) {
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data =
          await rootBundle.load(join("assets/database", "db.sqlite"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    return openDatabase(path);
  }

  static Future<List<Map<String, dynamic>>> getCat() async {
    Database db = await initDb();
    return db.query(
      'articlegroups',
      where: "parentId =0",
    );
  }

  Future<List<Map<String, dynamic>>> getArticlesAndGroups(int id) async {
    var db = await initDb();

    var articles = await db!.query(
      'articles',
      where: 'groupId = ?',
      whereArgs: [id],
    );

    var articleGroups = await db.query(
      'articlegroups',
      where: 'parentId = ?',
      whereArgs: [id],
    );
    print([...articles, ...articleGroups]);
    return [...articles, ...articleGroups];
  }

  Future<List<Map<String, dynamic>>> getArticle(int id) async {
    Database db = await initDb();

    // Query the article table
    List<Map<String, dynamic>> articles = await db.query(
      'articles',
      where: 'groupId = ?',
      whereArgs: [id],
    );

    // Combine the results
    List<Map<String, dynamic>> combinedResults = [];
    combinedResults.addAll(articles);

    return combinedResults;
  }

  Future<List<Map<String, dynamic>>> getContent(int id) async {
    Database db = await initDb();
    return db.query('articles', where: 'groupId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getContentSearch(int id) async {
    Database db = await initDb();
    return db.query('articles', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getPrayers(
    int id,
  ) async {
    Database db = await initDb();
    return db.query('duas_ziarat', where: 'groupId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getPrayersContent(int id) async {
    Database db = await initDb();
    return db.query('duas_ziarat', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getSearch(String textSearch,
      {required SearchEnum searchEnum}) async {
    Database db = await initDb();
    String query = "SELECT * FROM articles WHERE _text LIKE '%$textSearch%'";
    switch (searchEnum) {
      case SearchEnum.title:
        query = "SELECT * FROM articles WHERE _text LIKE '%$textSearch%'";

        break;
      case SearchEnum.content:
        query = "SELECT * FROM articles WHERE title LIKE '%$textSearch%'";

      case SearchEnum.both:
        query =
            "SELECT * FROM articles WHERE title LIKE '%$textSearch%' OR _text LIKE '%$textSearch%'";
      default:
    }
    return db.rawQuery(query);
  }

  Future<List<Map<String, dynamic>>> getContentAllsave(int id) async {
    Database db = await initDb();
    return db.query('articles', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getAllsave() async {
    Database db = await initDb();
    return db.query(
      'bookmark',
    );
  }

  insertArticle({
    required String title,
    required int id,
    required int groupId,
  }) async {
    Database db = await initDb();
    db.insert("bookmark", {
      "id": id,
      "groupId": groupId,
      "title": title,
    });
  }

  deleteArticle({
    required int id,
  }) async {
    Database db = await initDb();
    db.delete("bookmark", where: "id = ?", whereArgs: [id]);
  }
}

enum SearchEnum { title, content, both }
