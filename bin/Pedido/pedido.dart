import '../Config/database_connect.dart';

class Pedido {
  int idCliente;
  int idProduto;
  String dataPedido;
  int qntdItemPedido;

  Pedido(this.idCliente, this.idProduto, this.dataPedido, this.qntdItemPedido);

  Future<void> salvarNoBanco() async {
    var conn = await Database.getConnection();

    try {
      var result = await conn.query(
        'INSERT INTO pedidos (idClientes, dataPedido) VALUES (?, ?)',
        [idCliente, dataPedido],
      );


      int? idPedido = result.insertId;

      await conn.query(
        'INSERT INTO itens_pedidos (idPedido, idProdutos,qntdItemPedido) VALUES (?, ?, ?)',
        [idPedido, idProduto, qntdItemPedido],
      );

      print("Pedido e item criado com sucesso!");
    } catch (e) {
      print('Erro ao salvar o pedido: $e');
    } finally {
      await conn.close();
    }
  }
}
