import 'package:evira/model/address_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../styles/strings.dart';

class AddressesDatabase {
  AddressesDatabase._();
  static final AddressesDatabase db = AddressesDatabase._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'addresses.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${AppProperties.addressTable} (
        addressId INTEGER PRIMARY KEY,
        ${AppProperties.columnCountry} TEXT NOT NULL,
        ${AppProperties.columnCity} TEXT NOT NULL,
        ${AppProperties.columnStreet} TEXT NOT NULL,
        ${AppProperties.columnPostcode} TEXT NOT NULL
      )
    ''');
  }

  insertAddress(AddressModel address) async {
    final db = await database;
    await db!.insert(AppProperties.addressTable, address.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<AddressModel>> getAddresses() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query(AppProperties.addressTable);
    return List.generate(maps.length, (i) {
      return AddressModel(
          country: maps[i][AppProperties.columnCountry],
          city: maps[i][AppProperties.columnCity],
          street: maps[i][AppProperties.columnStreet],
          postcode: maps[i][AppProperties.columnPostcode]
      );
    });
  }

  deleteAddress(String name) async {
    final db = await database;
    await db!.delete(AppProperties.addressTable, where: '${AppProperties.columnCountry} = ?', whereArgs: [name]);
  }

  deleteAllAddresses() async {
    final db = await database;
    await db!.delete(AppProperties.addressTable);
  }


}