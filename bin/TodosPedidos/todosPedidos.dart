import '../Config/database_connect.dart';

class TodosPedidos {
  int idPedido;
  String dataPedido;
  int idClientes;

  TodosPedidos(this.idPedido, this.dataPedido, this.idClientes);

  Future<void> puxarDoBanco() async {
    var conn = await Database.getConnection();

    try {
      await conn.query('SELECT * FROM PEDIDOS');
    } catch (e) {}
  }
}
