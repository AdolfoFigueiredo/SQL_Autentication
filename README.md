# Autenticação de Usuários com SQL Puro

## Descrição do Projeto

Sistema de autenticação de usuários implementado **100% em SQL puro**, utilizando MySQL como SGBD (Sistema de Gerenciamento de Banco de Dados). O projeto foi desenvolvido como parte da disciplina de **Técnicas de Linguagens de Programação**, sob orientação do Professor **Abner Lourenço** ([GitHub](https://www.github.com/jedin01)).

O sistema demonstra o uso avançado de **Stored Procedures**, **Views** e **Estruturas de Controle** em SQL para implementar funcionalidades de autenticação sem necessidade de código backend.

---

## Funcionalidades

- **Cadastro de Usuários** - Cria novos usuários com validação de email duplicado
- **Autenticação** - Valida credenciais (email e senha)
- **Validação de Dados** - Verifica existência de emails antes de inserir
- **Mensagens de Resposta** - Retorna mensagens apropriadas para cada situação

---

## Estrutura do Banco de Dados

### Tabela: `USERS`

```sql
CREATE TABLE USERS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
```

| Campo      | Tipo         | Descrição                                          |
| ---------- | ------------ | -------------------------------------------------- |
| `id`       | INT          | Identificador único do usuário (auto-incrementado) |
| `name`     | VARCHAR(255) | Nome completo do usuário                           |
| `email`    | VARCHAR(255) | Email único do usuário                             |
| `password` | VARCHAR(255) | Senha do usuário                                   |

---

## Procedures Disponíveis

### 1. `createUser`

Cadastra um novo usuário no sistema com validação de email.

**Parâmetros:**

- `userName` (VARCHAR) - Nome do usuário
- `userEmail` (VARCHAR) - Email do usuário
- `userPassword` (VARCHAR) - Senha do usuário

**Retorno:**

- Sucesso: `"usuário criado com sucesso"`
- Dplicatas: `"Este email já está em uso"`
- Erro Genérico: `"Erro ao criar usuário"`

**Exemplo de Uso:**

```sql
CALL createUser('João Silva', 'joao@email.com', 'senha123');
```

---

### 2. `autenticateUser`

Autentica um usuário verificando se as credenciais estão corretas.

**Parâmetros:**

- `userEmail` (VARCHAR) - Email do usuário
- `userPassword` (VARCHAR) - Senha do usuário

**Retorno:**

- Sucesso: `"usuário autenticado com sucesso"`
- Dados incorretos: `"Email ou senha incorretos"`
- Erro genérico: `"Erro ao autenticar usuários"`

**Exemplo de Uso:**

```sql
CALL autenticateUser('joao@email.com', 'senha123');
```

---

## Como Usar

### Pré-requisitos

- MySQL 5.7+ instalado

### Instalação

1. **Clone ou acesse o repositório:**

```bash
git clone https://www.github.com/AdolfoFigueiredo/sqlAutentication.git

cd sqlAutentication
```

2. **Execute o script de inicialização:**

```bash
mysql -u root -p < init.sql
```

3. **Use o banco de dados:**

```bash
mysql -u root -p
USE sql_autentication;
```

### Exemplos Práticos

**Cadastrar um novo usuário:**

```sql
CALL createUser('Carlos', 'carlos@email.com', 'carlos123');
```

**Autenticar um usuário:**

```sql
CALL autenticateUser('carlos@email.com', 'carlos123');
```

**Tentar cadastrar email duplicado:**

```sql
CALL createUser('Pedro', 'carlos@email.com', 'pedro123');
-- Resultado: "Este email já está em uso"
```

**Autenticar com senha incorreta:**

```sql
CALL autenticateUser('carlos@email.com', 'senhaerrada');
-- Resultado: "Email ou senha incorretos"
```

---

## Dados de Teste

O script `init.sql` já insere 3 usuários de teste:

| ID  | Nome   | Email            | Senha      |
| --- | ------ | ---------------- | ---------- |
| 1   | Adolfo | adolfo@email.com | adolfo1234 |
| 2   | Abner  | abner@email.com  | abner1234  |
| 3   | João   | joao@email.com   | joao1234   |

---

## ATENÇÃO

**Este projeto foi desenvolvido para fins educacionais. Em produção:**

- **NÃO** armazene senhas em texto plano
- **USE** algoritmos de hash seguro (bcrypt, Argon2, SHA-256 com salt)
- **IMPLEMENTE** validação de entrada e prepared statements
- **PROTEJA** o acesso ao banco de dados com credenciais fortes

---

## Conceitos SQL Utilizados

- **Stored Procedures** - Para encapsular lógica de negócio
- **Estruturas de Controle** (IF/ELSE) - Para validações
- **Consultas de Existência** (EXISTS) - Para verificar duplicatas
- **DELIMITER** - Para definir procedimentos com múltiplas statements

---

## Autor

Desenvolvido como projeto educacional da disciplina de **Técnicas de Linguagens de Programação**.

- Por **Adolfo Figueiredo <calebfigueiredo28@gmail.com>**.

---

## Algumas Referências

- [MySQL Stored Procedures Documentation](https://dev.mysql.com/doc/refman/8.0/en/create-procedure.html)
- [MySQL Control Structures](https://dev.mysql.com/doc/refman/8.0/en/flow-control-statements.html)

---

**Última atualização:** 10 de março de 2026
