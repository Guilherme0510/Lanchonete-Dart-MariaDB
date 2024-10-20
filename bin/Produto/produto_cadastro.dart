import 'dart:io';
import 'produto.dart';

Future<void> cadastreProduto() async {
  print('Bem vindo a tela de adicionar produto');
  print('Deseja adicionar um produto?(sim/não)');
  String validacaoProduto = stdin.readLineSync()!;

  while (validacaoProduto == "sim") {
    stdout.write('Qual seria o nome do produto?');
    String nomeProduto = stdin.readLineSync()!;

    stdout.write('Qual seria a descrição do produto?');
    String descProduto = stdin.readLineSync()!;

    stdout.write('Qual seria o preço do produto?');
    String precoInput = stdin.readLineSync()!;
    double preco = double.tryParse(precoInput) ?? 0.0;

    Produto criar = Produto(nomeProduto, descProduto, preco);
    await criar.salvarNoBanco();

    print('Deseja criar mais algum produto?');
    validacaoProduto = stdin.readLineSync()!.toLowerCase();
  }
}

Future<void> editeProduto() async {
  print('Bem-vindo à tela de editar produto');
  print('Deseja editar um produto? (sim/não)');
  String validacaoProduto = stdin.readLineSync()!.toLowerCase();

  while (validacaoProduto == "sim") {
    stdout.write('Digite o ID do produto para edição: ');
    String idProdutoInput = stdin.readLineSync()!;
    int idProduto = int.tryParse(idProdutoInput) ?? 0; 

    stdout.write('Digite o novo nome do produto: ');
    String nomeProduto = stdin.readLineSync()!;

    stdout.write('Digite a nova descrição do produto: ');
    String descProduto = stdin.readLineSync()!;

    stdout.write('Digite o novo preço do produto: ');
    String precoInput = stdin.readLineSync()!;
    double preco = double.tryParse(precoInput) ?? 0.0;

    Produto editar = Produto(nomeProduto, descProduto, preco);

    await editar.editarProduto(idProduto);

    print('Deseja editar mais algum produto? (sim/não)');
    validacaoProduto = stdin.readLineSync()!.toLowerCase();
  }
}


Future<void> excluirProduto() async {
  print('Digite o ID do produto que deseja excluir: ');
  int id = int.parse(stdin.readLineSync()!);

  print('Tem certeza que deseja excluir o produto? (sim/não)');
  String confirmacao = stdin.readLineSync()!;

  if (confirmacao.toLowerCase() == 'sim') {
    await Produto.excluirProduto(id);
  } else {
    print('Exclusão cancelada.');
  }
}
