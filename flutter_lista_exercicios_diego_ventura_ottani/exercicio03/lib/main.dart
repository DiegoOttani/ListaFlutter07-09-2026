import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaNumero(),
    );
  }
}

class TelaNumero extends StatefulWidget {
  @override
  _TelaNumeroState createState() => _TelaNumeroState();
}

class _TelaNumeroState extends State<TelaNumero> {
  final numeroController = TextEditingController();

  String resultado = '';

  void calcular() {
    int? numero = int.tryParse(numeroController.text);

    if (numero == null) {
      setState(() {
        resultado = 'Digite um número inteiro válido!';
      });
      return;
    }

    int antecessor = numero - 1;
    int sucessor = numero + 1;

    setState(() {
      resultado = 'Número: $numero\nAntecessor: $antecessor\nSucessor: $sucessor';
    });
  }

  void limpar() {
    numeroController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercício 3 - Antecessor e sucessor')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: calcular,
                  child: Text('Calcular'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: limpar,
                  child: Text('Limpar'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}