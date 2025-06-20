# 🎨 GitHub Contribution Graph Art Generator

Um bot que desenha texto no seu **GitHub Contribution Graph** usando commits estratégicos! Transforme seu perfil GitHub em uma obra de arte pixelizada.


## 🚀 Como Funciona

O bot cria commits vazios em datas específicas para formar letras e números no gráfico de contribuições do GitHub. Cada "pixel" verde no gráfico representa um commit em um dia específico.

### 📊 Estrutura do GitHub Contribution Graph
- **53 colunas** (semanas do ano)
- **7 linhas** (domingo a sábado)
- Cada quadradinho verde = pelo menos 1 commit naquele dia

## 🛠️ Instalação e Uso

### 1. Clone o repositório
```bash
git clone https://github.com/Luizfelipereal007/Commit-mensagem.git
cd Commit-mensagem
```

### 2. Configure suas credenciais
Edite o arquivo `commit_bot.sh` e altere as linhas 4-5:
```bash
git config user.name "SEU_NOME_GITHUB"
git config user.email "seu-email@exemplo.com"
```

### 3. Configure o texto (linha 8)
```bash
texto="seu-texto-aqui"
```

### 4. Configure a data inicial (linha 23)
```bash
start_date="2024-01-07"  # Deve ser sempre um DOMINGO
```

### 5. Execute o bot
```bash
chmod +x commit_bot.sh
./commit_bot.sh
```

## ⚙️ Configuração

### 📝 Alterando o Texto
Na linha 8 do arquivo `commit_bot.sh`:
```bash
# Exemplos:
texto="hello-world"
texto="github-2024"
texto="code-art"
texto="feliz-natal"
```

### 📅 Alterando a Data Inicial
Na linha 23, use sempre um **DOMINGO**:
```bash
start_date="2024-03-03"  # Março
start_date="2024-06-02"  # Junho
start_date="2024-09-01"  # Setembro
```

## 🔤 Caracteres Suportados

### Letras
```
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
a b c d e f g h i j k l m n o p q r s t u v w x y z
```

### Números
```
0 1 2 3 4 5 6 7 8 9
```

### Símbolos Especiais
```
- _ . ! ? + = @ # & % * / \ | ( ) [ ] { } < > : ; , ' "
```

## 📋 Exemplos de Uso

### Exemplo 1: Mensagem de Ano Novo
```bash
texto="feliz-2024"
start_date="2024-01-07"
```

### Exemplo 2: Frase Motivacional
```bash
texto="never-give-up"
start_date="2024-06-02"
```

## 🎯 Resultado Esperado

Após executar o script:

1. **Commits criados**: Vários commits vazios com datas retroativas
2. **Push automático**: Enviado para seu repositório GitHub
3. **Visualização**: Em 5-10 minutos, visite seu perfil GitHub
4. **Arte formada**: Seu texto aparecerá desenhado no gráfico de contribuições

## ⚠️ Avisos Importantes

### 🔒 Backup
- **Sempre faça backup** do seu repositório antes de executar
- O script faz push automático - não há volta fácil

### 📊 Limitações do GitHub
- Máximo de **1 ano** de histórico visível
- Commits muito antigos podem não aparecer

### 🗑️ Como Desfazer
Se quiser remover os commits:
```bash
# Ver quantos commits foram criados
git log --oneline | head -20

# Remover os últimos N commits (substitua N pelo número)
git reset --hard HEAD~N

# Force push para o GitHub
git push --force-with-lease origin main
```

## 🎨 Inspiração

Inspirado na arte ASCII e na criatividade da comunidade GitHub. Use com responsabilidade e divirta-se criando arte com código!

---

**⭐ Se este projeto te ajudou, deixe uma estrela!**

**🐛 Encontrou um bug? Abra uma issue!**

**💡 Tem uma ideia? Contribua com o projeto!**
