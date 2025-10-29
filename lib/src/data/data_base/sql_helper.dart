import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

///[SqlHelper] se encarga de gestionar al base de datos, Utiliza el patron singleton lo que significa que solo habrá una instancia de esta clase
///
class SqlHelper {
  static const String _databaseName = 'mecaInventory.db';
  //Esta instancia se usará para sincronizar las operaciones de acceso y modificación de la base de datos,
  //asegurando que solo una operación de base de datos se ejecute a la vez.
  static final _lock = Lock();

  ///[_privateConstructor]: Este es un constructor privado que evita que otras partes de la aplicación creen nuevas instancias de la clase [SqlHelper] directamente.
  ///  Solo se puede acceder a la instancia a través de la propiedad instance.
  SqlHelper._privateConstructor();

  ///Se usará este campo estático para obtener la instancia, asegurando que siempre se use la misma
  static final SqlHelper instance = SqlHelper._privateConstructor();

  //Es una variable estática privada que guarda la instancia de la base de datos. Es de tipo Database? (nullable), porque puede no estar inicializada al principio.
  static Database? _database;

  /// Este getter asíncrono garantiza que solo se creará una instancia de la base de datos una vez.
  /// Si la base de datos ya ha sido creada,
  /// simplemente la devuelve. Si aún no se ha creado, llama al metodo interno para inicializarla y luego la devuelve.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    await _lock.synchronized(() async {
      //Esto obtiene la ruta del directorio adecuado para almacenar bases de datos en el dispositivo.
      final path = await getDatabasesPath();
      _database = await openDatabase(
        //Se utiliza para construir rutas de archivo de manera segura y correcta entre diferentes sistemas operativos
        join(path, _databaseName),
        version: 1,
        onDowngrade: onDatabaseDowngradeDelete,
        onCreate: _onCreate,
        onOpen: _onOpen,
      );
    });

    return _database;
  }

  Future<void> _onOpen(Database db) async {}

  void _error(dynamic error) {
    print('LocalDB -> Error:$error');
  }

  Future<void> _onCreate(Database db, int version) async {
    print('LocalDB -> Creating database version $version');
    await db.transaction(
      (txn) async {
        await txn
            .execute(
              'CREATE TABLE IF NOT EXISTS products ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'name TEXT NOT NULL, '
              'description TEXT, '
              'cost TEXT, '
              'initial_quantity INTEGER NOT NULL, '
              'current_quantity INTEGER NOT NULL, '
              'image BLOB ' // Esto es igual a List<int>
              ')',
            )
            .catchError(_error);
      },
    );
  }
}
