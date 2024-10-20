import 'dart:io';
import './Cliente.dart';

Future<void> cadastrarCliente() async {
  print('Deseja cadastrar um novo cliente?');
  String cadastro = stdin.readLineSync()!;
  if (cadastro.toLowerCase() == "sim") {
    stdout.write("Qual o nome do cliente: ");
    String nome = stdin.readLineSync()!;
    stdout.write("Qual o telefone do cliente: ");
    String telefone = stdin.readLineSync()!;
    stdout.write("Qual o endereço do cliente: ");
    String endereco = stdin.readLineSync()!;

    Cliente cliente = Cliente(nome, telefone, endereco);
    await cliente.salvarNoBanco();
  }
}
