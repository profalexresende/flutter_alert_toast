import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaSoma(),
    );
  }
}
//-------------CRIAÇÃO DA TELA DO APP -------------------
class TelaSoma extends StatefulWidget {
  const TelaSoma({super.key});

  @override
  State<TelaSoma> createState() => _TelaSomaState();
}
//---------------Criação do Estado da Tela--------------
class _TelaSomaState extends State<TelaSoma> {

  //INPUTS
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();

  double resultado = 0;

  //-----------FUNÇÃO TOAST (SNACKBAR)------------
  void mostrarToast(String mensagem) {
    // ScaffoldMessenger é o responsável por mostrar mensagens rápidas na tela
    // Ele precisa do "context" da tela atual para saber onde exibir
    ScaffoldMessenger.of(context).showSnackBar(
      // SnackBar é a barra que aparece na parte de baixo da tela
      SnackBar(
        // content é o conteúdo da mensagem que será exibida
        content: Text(mensagem),
        // duration define por quanto tempo a mensagem ficará visível
        duration: const Duration(seconds: 2),
      ),
    );
  }
   //-----------FUNÇÃO ALERT-----------------------
  void mostrarAlert(String mensagem) {
    // showDialog abre uma janela de diálogo na tela
    showDialog(
      // context informa em qual tela o diálogo deve aparecer
      context: context,
      // builder cria o conteúdo da janela
      builder: (context) {
        // AlertDialog é o tipo de janela que vamos mostrar
        return AlertDialog(
          // title é o título da janela
          title: const Text('Resultado'),
          // content é o texto principal exibido no alerta
          content: Text(mensagem),
          // actions são os botões que aparecem no alerta
          actions: [
            // TextButton cria um botão simples
            TextButton(
              // onPressed define o que acontece quando o botão é clicado
              onPressed: () {
                // Navigator.pop fecha o AlertDialog
                Navigator.pop(context);
              },
             // Texto exibido no botão
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  //-----------SOMAR------------------------------
  void somar() {
    double n1 = double.tryParse(numero1Controller.text) ?? 0;
    double n2 = double.tryParse(numero2Controller.text) ?? 0;

    setState(() {
      resultado = n1 + n2;
    });

    mostrarToast("Resultado: $resultado");
  }

  //-----------SUBTRAIR---------------------------
  void subtrair() {
    double n1 = double.tryParse(numero1Controller.text) ?? 0;
    double n2 = double.tryParse(numero2Controller.text) ?? 0;

    setState(() {
      resultado = n1 - n2;
    });

    mostrarAlert("Resultado: $resultado");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Super Calculadora'),
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: numero1Controller,
              decoration: const InputDecoration(
                labelText: 'Digite o primeiro número',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: numero2Controller,
              decoration: const InputDecoration(
                labelText: 'Digite o segundo número',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: somar,
              child: const Text('Somar'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: subtrair,
              child: const Text('Subtrair'),
            ),

            const SizedBox(height: 20),

            Text(
              'Resultado: $resultado',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}