Aqui está seu README **atualizado**, com uma nova seção de **Firebase + API**, mantendo direto ao ponto e útil pra sua dupla:

---

# 📱 App_Trabalho

> Guia de referência rápida para colaboradores do projeto — comandos Git, Flutter, Firebase e API.

---

## 📋 Índice

* [Configuração Inicial](#-configuração-inicial)
* [Fluxo de Commits Git](#-fluxo-de-commits-git)
* [Branches](#-branches)
* [Sincronização com o Repositório](#-sincronização-com-o-repositório)
* [Dependências Flutter](#-dependências-flutter)
* [Firebase](#-firebase)
* [API do Projeto](#-api-do-projeto)
* [Correção de Erros](#-correção-de-erros)
* [Comandos Úteis Flutter](#-comandos-úteis-flutter)

---

## ⚙️ Configuração Inicial

```bash
git clone https://github.com/usuario/App_Trabalho.git
cd App_Trabalho
flutter pub get
```

---

## ✅ Fluxo de Commits Git

```bash
git status
git add .
git commit -m "feat: descrição"
git push origin nome-da-branch
```

---

## 🌿 Branches

```bash
git checkout -b nome-da-branch
git checkout nome-da-branch
git branch -a
```

---

## 🔄 Sincronização

```bash
git pull origin nome-da-branch
git fetch origin
```

---

## 📦 Dependências Flutter

```bash
flutter pub get
flutter pub upgrade
flutter pub add nome_do_pacote
```

---

## 🔥 Firebase

### 1. Instalar CLI do Firebase

```bash
npm install -g firebase-tools
```

### 2. Login

```bash
firebase login
```

### 3. Inicializar no projeto

```bash
firebase init
```

Selecionar:

* Firestore / Authentication (se estiver usando)
* Escolher projeto existente

---

### 4. Configurar no Flutter

Adicionar dependências:

```bash
flutter pub add firebase_core
flutter pub add firebase_auth
flutter pub add cloud_firestore
```

---

### 5. Inicializar Firebase no app

No `main.dart`:

```dart
await Firebase.initializeApp();
```

---

### 6. Rodar com Firebase

```bash
flutter run
```

---

## 🌐 API do Projeto

### ▶️ Rodar a API (backend)

*(ajuste dependendo da tecnologia usada — exemplo Node.js)*

```bash
cd api
npm install
npm run dev
```

ou

```bash
npm start
```

---

### ▶️ Testar API

```bash
http://localhost:3000
```

Se estiver usando celular/emulador:

* Trocar `localhost` por IP da máquina (ex: `192.168.x.x`)

---

### ▶️ Conectar Flutter com API

Exemplo:

```dart
final response = await http.get(
  Uri.parse('http://192.168.x.x:3000/rota'),
);
```

---

## 🔧 Correção de Erros

### Flutter geral

```bash
flutter clean
flutter pub get
```

### Firebase

```bash
flutterfire configure
```

### API

```bash
npm install
npm audit fix
```

### Cache

```bash
dart pub cache repair
```

---

## 🚀 Comandos Úteis Flutter

```bash
flutter run
flutter devices
flutter analyze
flutter test
```

---

## ⚠️ Dicas Importantes

* Sempre rodar antes de começar:

```bash
git pull
flutter pub get
```

* Se der erro:

```bash
flutter clean
```

* API não conecta?
  ✔ Verifique IP
  ✔ Backend rodando
  ✔ Porta correta

---

## 👥 Colaboradores

| Nome    | GitHub         |
| ------- | -------------- |
| Adrian  | @adriansouza05 |
| Gabriel | @Noluvvvv      |

---
