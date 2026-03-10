# Ideias - Sistema de Autenticação em SQL Puro

## O que quería fazer:

Criar 2 funções usando procedures, estrutura de condição e IO para manipular os dados.

---

## função BuscarUsuario:

### O que era:

### 1. Pede: `email`

### 2. Verifica:

- Email Existe ?
  - Sim: Retorna a tupla

**Status:** Não fiz

---

## função Cadastro:

### O que quería:

### 1. Pede: ` email, password`

### 2. Verifica:

- Email Existente?
  - Sim! Retorna -> Email já existe

### 3. Opcional:

- Hashear password

**Status:** Não Fiz

### 4. Salvar Dados

### 5. Retornar mensagem consoante o resultado

- Sucesso: caso usuario for criado com sucesso
- Erro Generico: Erro ao criar usuario

**Status:** Fiz (mais ou menos)

- Fiz a parte de verificar se email já existe
- Hash de password? Nah, deixei em branco mesmo
- Sucesso retorna mensagem

---

## Função Autenticar:

### O que quería:

### 1. Pede: `email, password`

### 2. Verifica:

- Email não existe?
  - Sim! Retorna Email ou senha incorrectos

- Password Pertence a este usuario?
  - Não! Retorna Email ou senha incorrectos

**Status:** Fiz exatamente assim

- Valida email E password
- Retorna a mensagem genérica
- Tá funcionando bem

---

## Resumo:

- **BuscarUsuario:** Nah, achei que não precisava mesmo
- **Cadastro:** ~80% do que quería
- **Autenticar:** 100% do que quería ✅
