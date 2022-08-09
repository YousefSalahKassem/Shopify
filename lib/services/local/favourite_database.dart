import 'package:evira/styles/strings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/product_model.dart';


class FavoriteDatabase {
  FavoriteDatabase._();
  static final FavoriteDatabase db = FavoriteDatabase._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await db.initDatabase();
    return _database;
  }

  initDatabase() async{
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'favourite.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${AppProperties.tableFavouriteProduct} (
        favoriteId INTEGER PRIMARY KEY AUTOINCREMENT,
        ${AppProperties.columnId} INTEGER NOT NULL,
        ${AppProperties.columnImage} TEXT NOT NULL,
        ${AppProperties.columnName} TEXT NOT NULL,
        ${AppProperties.columnDescription} TEXT NOT NULL,
        ${AppProperties.columnPrice} INTEGER NOT NULL
      )
    ''');
  }

  insertFavourite(Product product) async {
    final db = await database;
    await db!.insert(AppProperties.tableFavouriteProduct, product.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Product>> getFavourite() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(AppProperties.tableFavouriteProduct);
    return List.generate(maps.length, (i) {
      return Product(
          id: maps[i][AppProperties.columnId],
          name: maps[i][AppProperties.columnName],
          imageUrl: maps[i][AppProperties.columnImage],
          price: maps[i][AppProperties.columnPrice],
          details: maps[i][AppProperties.columnDescription],
      );
    });
  }

  deleteFavourite(String name) async {
    final db = await database;
    await db!.delete(AppProperties.tableFavouriteProduct, where: '${AppProperties.columnName} = ?', whereArgs: [name]);
  }

  checkFavourite(String name) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(AppProperties.tableFavouriteProduct, where: '${AppProperties.columnName} = ?', whereArgs: [name]);
    return maps.length > 0;
  }
}