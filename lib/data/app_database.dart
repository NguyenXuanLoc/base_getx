import 'package:docsify/data/model/doctor_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String tableDoctor = 'doctors';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();

  static Database? _database;

  AppDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final nameType = 'TEXT NOT NULL';
    final avatarType = 'TEXT NOT NULL';
    final specialization = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableDoctor ( 
  ${DoctorField.id} $idType, 
  ${DoctorField.name} $nameType,
  ${DoctorField.avatar} $avatarType,
  ${DoctorField.specialization} $specialization
  )
''');
  }

  Future<DoctorModel> create(DoctorModel doctor) async {
    final db = await instance.database;
    final id = await db.insert(tableDoctor, doctor.toJson());
    return doctor.copy(id: id);
  }

  Future<DoctorModel> readDoctor(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableDoctor,
      columns: DoctorField.values,
      where: '${DoctorField.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return DoctorModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<DoctorModel>> readAllDoctors() async {
    final db = await instance.database;

    final result = await db.query(tableDoctor);

    return result.map((json) => DoctorModel.fromJson(json)).toList();
  }

  Future<int> update(DoctorModel Doctor) async {
    final db = await instance.database;

    return db.update(
      tableDoctor,
      Doctor.toJson(),
      where: '${DoctorField.id} = ?',
      whereArgs: [Doctor.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableDoctor,
      where: '${DoctorField.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
