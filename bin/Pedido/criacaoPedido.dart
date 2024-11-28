import 'dart:io';
import './pedido.dart';

Future<void> criarPedido() async {
  stdout.write("Deseja criar um novo pedido para algum cliente? (sim/não): ");
  String validacaoPedido = stdin.readLineSync()!.toLowerCase();

  if (validacaoPedido == "sim") {
    stdout.write("Qual id de cliente que gostaria de adicionar um pedido? ");
    int idCliente;
    try {
      idCliente = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Por favor, insira um número válido para o ID do cliente.");
      return;
    }
    stdout.write("Qual id de produto gostaria de adicionar ao cliente $idCliente? ");
    int idProduto;
    try {
      idProduto = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Por favor, insira um número válido para o ID do produto.");
      return;
    }

    stdout.write("Quantos produtos deseja adicionar? ");
    int qntdItemPedido;
    try {
      qntdItemPedido = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Por favor, insira um número válido para o ID do produto.");
      return;
    }

    stdout.write("Qual a data do pedido do produto? (Formato: YYYY-MM-DD): ");
    String dataPedido = stdin.readLineSync()!;

    Pedido pedido = Pedido(idCliente, idProduto, dataPedido, qntdItemPedido);
    await pedido.salvarNoBanco();

    print("Pedido criado e salvo no banco com sucesso!");
  } else {
    print("Operação cancelada.");
  }
}
