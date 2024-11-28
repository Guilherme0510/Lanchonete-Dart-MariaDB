import '../Config/database_connect.dart';
Future<List<Map<String, dynamic>>> buscarTodosPedidos() async {
  var conn = await Database.getConnection();
  
  try {
    var resultados = await conn.query('''
      SELECT 
        PEDIDOS.idPedido, 
        CLIENTES.nomeCliente, 
        PEDIDOS.dataPedido, 
        PRODUTOS.nomeProduto, 
        ITENS_PEDIDOS.qntdItemPedido,
        PRODUTOS.preco,
        (PRODUTOS.preco * ITENS_PEDIDOS.qntdItemPedido) AS valorTotalProduto
      FROM 
        PEDIDOS
      JOIN 
        CLIENTES ON PEDIDOS.idClientes = CLIENTES.idClientes
      JOIN 
        ITENS_PEDIDOS ON PEDIDOS.idPedido = ITENS_PEDIDOS.idPedido
      JOIN 
        PRODUTOS ON ITENS_PEDIDOS.idProdutos = PRODUTOS.idProdutos;
    ''');

    List<Map<String, dynamic>> pedidos = [];
    for (var linha in resultados) {
      var pedido = pedidos.firstWhere(
        (p) => p['idPedido'] == linha['idPedido'], 
        orElse: () => {},
      );

      if (pedido.isEmpty) {
        pedido = {
          'idPedido': linha['idPedido'],
          'dataPedido': linha['dataPedido'],
          'nomeCliente': linha['nomeCliente'],
          'produtos': [],
        };
        pedidos.add(pedido);
      }

      var quantidade = linha['qntdItemPedido'] ?? 0; 
      var preco = linha['preco'] ?? 0.0; 

      pedido['produtos'].add({
        'nomeProduto': linha['nomeProduto'],
        'quantidade': quantidade,
        'preco': preco,
      });
    }
    
    return pedidos;
  } catch (e) {
    print("Erro ao buscar dados: $e");
    return [];
  } finally {
    await conn.close();
  }
}
