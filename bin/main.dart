import 'dart:io';

import './Cliente/cliente_cadastro.dart';
import './Produto/produto_cadastro.dart';

void main() async {
  bool continuar = true;

  while (continuar) {
    print('*** Sistema de Gestão ***');
    print('Escolha uma opção:');
    print('1. Gerenciar Clientes');
    print('2. Gerenciar Produtos');
    print('3. Sair');
    String escolha = stdin.readLineSync()!;

    switch (escolha) {
      case '1':
        await menuClientes();
        break;
      case '2':
        await menuProdutos();
        break;
      case '3':
        continuar = false;
        print('Encerrando o sistema...');
        break;
      default:
        print('Opção inválida. Tente novamente.');
    }
  }
}

Future<void> menuClientes() async {
  print('*** Gestão de Clientes ***');
      await cadastrarCliente();
}

Future<void> menuProdutos() async {
  print('*** Gestão de Produtos ***');
  print('Escolha uma opção:');
  print('1. Cadastrar Produto');
  print('2. Editar Produto');
  print('3. Excluir Produto');
  String escolha = stdin.readLineSync()!;

  switch (escolha) {
    case '1':
      await cadastreProduto();
      break;
    case '2':
      await editeProduto();
      break;
    case '3':
      await excluirProduto();
      break;
    default:
      print('Opção inválida.');
  }
}
