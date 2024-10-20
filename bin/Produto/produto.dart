import '../Config/database_connect.dart';

class Produto {
  String nome;
  String descricao;
  double preco;

  Produto(this.nome, this.descricao, this.preco);

  Future<void> salvarNoBanco() async {
    var conn = await Database.getConnection();

    try {
      await conn.query(
        'INSERT INTO produtos (nomeProduto, descricao, preco) VALUES (?, ?, ?)',
        [nome, descricao, preco]
      );
      print('Produto adicionado com sucesso.');
    } catch (e) {
      print('Erro ao adicionar o produto: $e');
    } finally {
      await conn.close();
    }
  }

  Future<void> editarProduto(int id) async { 
    var conn = await Database.getConnection();

    try {
      var result = await conn.query(
        'UPDATE produtos SET nomeProduto = ?, descricao = ?, preco = ? WHERE idProdutos = ?',
        [nome, descricao, preco, id]
      );

      if (result.affectedRows != 0) {
        print("Produto editado com sucesso.");
      } else {
        print("Nenhum produto encontrado com esse ID.");
      }
    } catch (e) {
      print('Erro ao atualizar o produto: $e');
    } finally {
      await conn.close();
    }
  }

  static Future<void> excluirProduto(int id) async {
    var conn = await Database.getConnection();
    try {
      var result = await conn.query(
        'DELETE FROM produtos WHERE idProdutos = ?',
        [id],
      );

      if (result.affectedRows != 0) {
        print('Produto excluído com sucesso.');
      } else {
        print("Nenhum produto encontrado com esse ID para excluir.");
      }
    } catch (e) {
      print('Erro ao excluir o produto: $e');
    } finally {
      await conn.close();
    }
  }
}
