# 🧮 Minha Super Calculadora — Flutter

Projeto didático desenvolvido em Flutter para alunos iniciantes.  
O app realiza **soma** e **subtração** entre dois números, e demonstra dois tipos de feedback visual ao usuário: **SnackBar** e **AlertDialog**.

---

## 📱 Funcionalidades

- Digitar dois números
- Somar os números (resultado exibido via **SnackBar**)
- Subtrair os números (resultado exibido via **AlertDialog**)
- Exibir o resultado na própria tela

---

## 🧠 Conceitos ensinados neste projeto

| Conceito | Descrição |
|---|---|
| `StatefulWidget` | Tela que consegue atualizar seus dados |
| `setState()` | Avisa o Flutter que algo mudou e precisa redesenhar a tela |
| `TextEditingController` | Lê o que o usuário digitou num campo de texto |
| `TextField` | Campo de entrada de texto |
| `ElevatedButton` | Botão com ação ao ser clicado |
| `double.tryParse()` | Converte texto em número com segurança |
| `??` (null safety) | Define um valor padrão caso a conversão falhe |
| `SnackBar` | Mensagem rápida que aparece na parte inferior da tela |
| `AlertDialog` | Janela de diálogo que exige confirmação do usuário |

---

## 📂 Estrutura do código

```
main.dart
│
├── MainApp              → Ponto de entrada do app (StatelessWidget)
│
└── TelaSoma             → Tela principal (StatefulWidget)
    │
    ├── numero1Controller    → Captura o 1º número digitado
    ├── numero2Controller    → Captura o 2º número digitado
    ├── resultado            → Guarda o resultado da operação
    │
    ├── mostrarToast()       → Exibe resultado via SnackBar
    ├── mostrarAlert()       → Exibe resultado via AlertDialog
    ├── somar()              → Realiza a soma e chama mostrarToast()
    └── subtrair()           → Realiza a subtração e chama mostrarAlert()
```

---

## 🔍 Trechos importantes explicados

### Lendo o que o usuário digitou
```dart
double n1 = double.tryParse(numero1Controller.text) ?? 0;
```
- `numero1Controller.text` → pega o texto digitado no campo
- `double.tryParse()` → tenta converter o texto em número
- `?? 0` → se a conversão falhar (ex: usuário digitou uma letra), usa 0

---

### Atualizando a tela com setState
```dart
setState(() {
  resultado = n1 + n2;
});
```
Sem o `setState`, a variável mudaria mas a tela **não seria redesenhada**.

---

### SnackBar — mensagem rápida
```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text(mensagem),
    duration: Duration(seconds: 2),
  ),
);
```
Aparece na parte inferior da tela e some automaticamente após 2 segundos.

---

### AlertDialog — janela de confirmação
```dart
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: Text('Resultado'),
      content: Text(mensagem),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        )
      ],
    );
  },
);
```
Exige que o usuário clique em **OK** para fechar.

---

## 🚀 Como executar

1. Certifique-se de ter o [Flutter instalado](https://flutter.dev/docs/get-started/install)
2. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/minha-calculadora-flutter.git
   ```
3. Acesse a pasta do projeto:
   ```bash
   cd minha-calculadora-flutter
   ```
4. Execute o app:
   ```bash
   flutter run
   ```

---

## 🛠️ Requisitos

- Flutter SDK 3.0 ou superior
- Dart 3.0 ou superior
- Android Studio ou VS Code com extensão Flutter

---

## 👨‍🏫 Sobre o projeto

Desenvolvido como material de aula para introdução ao desenvolvimento mobile com Flutter.  
Foco em clareza, simplicidade e boas práticas para iniciantes.
