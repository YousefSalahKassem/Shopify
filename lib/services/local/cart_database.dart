import 'package:evira/styles/strings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/product_model.dart';

class CartDatabase {
  CartDatabase._();
  static final CartDatabase db = CartDatabase._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await db.initDatabase();
    return _database;
  }

  initDatabase() async{
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'cart.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${AppProperties.tableCartProduct} (
        cartId INTEGER PRIMARY KEY,
        ${AppProperties.columnId} INTEGER NOT NULL,
        ${AppProperties.columnName} TEXT NOT NULL,
        ${AppProperties.columnPrice} INTEGER NOT NULL,
        ${AppProperties.columnDescription} TEXT NOT NULL,
        ${AppProperties.columnImage} TEXT NOT NULL,
        ${AppProperties.columnQuantity} INTEGER NOT NULL
      )
    ''');
  }

  insertCart(Product product) async {
    final db = await database;
    await db!.insert(AppProperties.tableCartProduct, product.toCartMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Product>> getCart() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(AppProperties.tableCartProduct);
    return List.generate(maps.length, (i) {
      return Product(
          name: maps[i][AppProperties.columnName],
          imageUrl: maps[i][AppProperties.columnImage],
          price: maps[i][AppProperties.columnPrice],
          details: maps[i][AppProperties.columnDescription],
          quantity: maps[i][AppProperties.columnQuantity],
          id: maps[i][AppProperties.columnId]
      );
    });
  }

  deleteCart(String name) async {
    final db = await database;
    await db!.delete(AppProperties.tableCartProduct, where: '${AppProperties.columnName} = ?', whereArgs: [name]);
  }

  updateCart(Product product) async {
    final db = await database;
    await db!.update(AppProperties.tableCartProduct, product.toMap(), where: '${AppProperties.columnName} = ?', whereArgs: [product.name]);
  }

  deleteAll() async {
    final db = await database;
    await db!.delete(AppProperties.tableCartProduct);
  }

  updateQuantity(Product product) async {
    final db = await database;
    await db!.update(AppProperties.tableCartProduct, product.toMap(), where: '${AppProperties.columnName} = ?', whereArgs: [product.name]);
  }

  checkProduct(Product product) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(AppProperties.tableCartProduct, where: '${AppProperties.columnName} = ?', whereArgs: [product.name]);
    return maps.length > 0;
  }
}