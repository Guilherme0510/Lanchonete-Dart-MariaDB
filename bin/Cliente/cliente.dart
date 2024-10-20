import '../Config/database_connect.dart';

class Cliente {
  String nome;
  String telefone;
  String endereco;

  Cliente(this.nome, this.telefone, this.endereco);

  Future<void> salvarNoBanco() async {
    var conn = await Database.getConnection();

    try {
      await conn.query(
        'INSERT INTO clientes (nomeCliente, TelCliente, EnderecoCliente) VALUES (?, ?, ?)',
        [nome, telefone, endereco],
      );
      print('Cliente inserido com sucesso.');
    } catch (e) {
      print('Erro ao inserir o cliente: $e');
    } finally {
      await conn.close();
    }
  }
}
