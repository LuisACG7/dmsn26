import 'dart:io';
import 'package:dmsn26/models/cast_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CastDB {

  static final nameDB = 'CASTDB';
  static final versionDB = 1;

  static Database? _database;
  Future<Database?> get database async {
    if( _database != null ) return _database;
    return _database = await _initDatabase();
  }
  
  Future<Database?> _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path,nameDB);
    return openDatabase(
      pathDB,
      version: versionDB,
      onCreate: createTables
    );
  }

  createTables(Database db, int version){
    String query = '''
      CREATE TABLE tblCast(
        idCast INTEGER PRIMARY KEY,
        nameCast VARCHAR(50),
        birthCast CHAR(10),
        gender CHAR(1),
      )
    ''';
    db.execute(query);
  }

  Future<int> INSERT(Map<String,dynamic> data) async {
    var conexion = await database;
    return conexion!.insert('tblCast', data);
  }

  Future<int> UPDATE(Map<String,dynamic> data) async {
    var conexion = await database;
    return conexion!.update('tblCast', data, where: 'idCast = ?', whereArgs: [data['idCast']]);
  }

  Future<int>DELETE(Map<String,dynamic> data) async {
    var conexion = await database;
    return conexion!.delete('tblCast', where: 'idCast = ?', whereArgs: [data['idCast']]);
  }

  Future<List<CastDAO>> SELECT() async {
    var conexion = await database;
    var res = await conexion!.query('tblCast');
    return res.map((cast) => CastDAO.fromMap(cast)).toList();
  }
}