import 'package:mysql1/mysql1.dart';

class Database {
  static Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'gui',
      password: 'r00t123',
      db: 'bd_lanchonete',
    );
    return await MySqlConnection.connect(settings);
  }
}
