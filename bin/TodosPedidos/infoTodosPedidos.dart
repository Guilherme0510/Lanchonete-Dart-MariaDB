import 'TodosPedidos.dart';

class TodosPedidos {
  int idPedido;
  String dataPedido;
  String nomeCliente;
  List<Map<String, dynamic>> produtos; // Lista de produtos do pedido
  double valorTotal;

  TodosPedidos(this.idPedido, this.dataPedido, this.nomeCliente, this.produtos, this.valorTotal);

  static Future<void> listarPedidos() async {
    var resultados = await buscarTodosPedidos();

    if (resultados.isEmpty) {
      print("Nenhum pedido encontrado.");
      return;
    }

    print("*** Lista de Pedidos ***");
    for (var pedido in resultados) {
      String dataFormatada = formatarDataParaBR(pedido['dataPedido']);
      print("ID Pedido: ${pedido['idPedido']}");
      print("Cliente: ${pedido['nomeCliente']}");
      print("Data do Pedido: $dataFormatada");
      print("Produtos:");

      double valorTotal = 0;
      for (var produto in pedido['produtos']) {
        print(" - ${produto['nomeProduto']} (Quantidade: ${produto['quantidade']}) - Preço: R\$ ${produto['preco']}");
        valorTotal += produto['preco'] * produto['quantidade'];
      }

      print("Valor Total: R\$ ${valorTotal.toStringAsFixed(2)}");
      print("-----");
    }
  }

  static String formatarDataParaBR(dynamic data) {
    try {
      if (data is DateTime) {
        return "${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}";
      } else if (data is String) {
        var partes = data.split('-');
        if (partes.length == 3) {
          return "${partes[2]}/${partes[1]}/${partes[0]}";
        }
      }
      return data.toString();
    } catch (e) {
      print("Erro ao formatar a data: $e");
      return data.toString();
    }
  }
}
