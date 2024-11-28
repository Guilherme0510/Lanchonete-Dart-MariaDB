O objetivo principal é criar um sistema de uma lanchonete, adm, em que o atentende faça o cadastro do cliente e do pedido e que assim consiga visualizar
os pedidos feitos.


**Banco de Dados**


Clientes: Armazenará informações dos clientes (ID, nome, telefone, endereço).
Produtos: Armazenará os itens do cardápio (ID do produto, nome, descrição, preço).
Pedidos: Armazenará os pedidos feitos (ID do pedido, data do pedido, ID do cliente).
Itens do Pedido: Ligará os produtos aos pedidos (ID do item, ID do pedido, ID do produto, quantidade).
Funcionários: Armazenará informações dos funcionários (ID, nome, cargo, telefone).
Pagamentos: Armazenará os métodos de pagamento utilizados nos pedidos (ID do pagamento, ID do pedido, forma de pagamento, valor pago).

Ver como se usa o view e implementar no banco de dados


*Passos aplicativo*


***1* - Criar um cadastro de cliente, e salvando os dados do cliente do banco de dados**
***2* - Criar um modo para que possa adicionar, editar e remover produtos do cardapio, mostrar todos os produtos do cardapio**
*3* - Fazer com que o usuário (atendente) consiga criar um pedido associando esse pedido ao cliente
*4* - Consulta de pedidos, mostrar todos os pedidos realizados, mostrando o cliente, os produtos e o valor total
*5* - Implementar uma view para mostrar o historico de pedidos do cliente selecionado