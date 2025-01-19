# Sistema de Gerenciamento de Oficina Mecânica

Este é um projeto de um **Sistema de Gerenciamento de Oficina Mecânica**, que permite gerenciar clientes, veículos, ordens de serviço, serviços realizados, peças e pagamentos. O objetivo é criar um sistema eficiente e intuitivo para auxiliar oficinas mecânicas no controle de seus processos operacionais.

##**Funcionalidades**
- **Gerenciamento de Clientes**: Cadastro de clientes com informações como nome, sobrenome, CPF/CNPJ, endereço, telefone e e-mail.
- **Cadastro de Veículos**: Associação de veículos aos clientes, incluindo informações como placa, modelo e ano.
- **Ordens de Serviço**: Registro de ordens de serviço com informações detalhadas, como serviços realizados, valores totais e status.
- **Controle de Estoque**: Cadastro de peças e acompanhamento de estoque, incluindo preços e quantidades.
- **Gestão de Pagamentos**: Registro de pagamentos associados às ordens de serviço.
- **Relações entre Tabelas**: Associação entre clientes, veículos, mecânicos, peças e serviços realizados.

## **Estrutura do Banco de Dados**

O sistema utiliza o **MySQL** para gerenciar o banco de dados. Abaixo estão as principais tabelas do projeto:

### Tabelas Principais:
1. **Cliente**
   - Informações pessoais dos clientes.
2. **Veículo**
   - Detalhes dos veículos associados aos clientes.
3. **Serviço**
   - Descrição dos serviços oferecidos pela oficina.
4. **Peças**
   - Controle de peças e estoque.
5. **Ordem de Serviço**
   - Registro das ordens de serviço realizadas.
6. **Pagamento**
   - Controle de pagamentos efetuados.

### Relacionamentos:
- Um **cliente** pode ter vários **veículos**.
- Um **veículo** pode estar associado a várias **ordens de serviço**.
- Uma **ordem de serviço** pode incluir vários **serviços** e **peças**.
- Uma **peça** pode ser utilizada em várias ordens de serviço.

## **Tecnologias Utilizadas**
- **MySQL**: Banco de dados relacional.
- **Workbench e DB Designer**: Ferramentas para modelagem e manipulação do banco de dados.
- **Git/GitHub**: Controle de versão e compartilhamento do projeto.

## **Como Usar**
1. Clone o repositório:
   ```bash
   git clone https://github.com/seu_usuario/seu_repositorio.git
   ```
2. Importe o script SQL no seu ambiente MySQL para criar o banco de dados e as tabelas.
3. Utilize o Workbench ou outra ferramenta de sua preferência para executar consultas e manipular os dados.

## **Consultas SQL Implementadas**
O projeto inclui diversas consultas SQL para exploração e análise dos dados, incluindo:
- **Recuperações simples**:
  ```sql
  SELECT * FROM cliente;
  ```
- **Filtros com WHERE**:
  ```sql
  SELECT * FROM veiculo WHERE ano > 2015;
  ```
- **Agrupamento e Ordenação**:
  ```sql
  SELECT modelo, COUNT(*) AS quantidade FROM veiculo GROUP BY modelo ORDER BY quantidade DESC;
  ```
- **Junções entre tabelas**:
  ```sql
  SELECT cliente.nome, veiculo.modelo FROM cliente
  INNER JOIN veiculo ON cliente.idCliente = veiculo.idCliente;
  ```

## **Próximos Passos**
- Implementar interface gráfica para o sistema.
- Adicionar relatórios automatizados sobre serviços realizados e estoque.
- Otimizar as consultas SQL para maior eficiência.

## **Contribuições**
Sinta-se à vontade para contribuir com o projeto! Envie pull requests ou relate problemas na aba de "Issues" do repositório.

---
**Autor**: [Tania Cremonini]  
**Licença**: Este projeto está licenciado sob a [MIT License](LICENSE).

