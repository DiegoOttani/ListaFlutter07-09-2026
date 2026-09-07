import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaMedia(),
    );
  }
}

class TelaMedia extends StatefulWidget {
  @override
  _TelaMediaState createState() => _TelaMediaState();
}

class _TelaMediaState extends State<TelaMedia> {
  final nota1Controller = TextEditingController();
  final nota2Controller = TextEditingController();
  final nota3Controller = TextEditingController();

  String resultado = '';

  void calcular() {
    double? n1 = double.tryParse(nota1Controller.text);
    double? n2 = double.tryParse(nota2Controller.text);
    double? n3 = double.tryParse(nota3Controller.text);

    if (n1 == null || n2 == null || n3 == null) {
      setState(() {
        resultado = 'Preencha as três notas corretamente!';
      });
      return;
    }

    double media = (n1 + n2 + n3) / 3;
    String situacao = media >= 6 ? 'Aprovado' : 'Reprovado';

    setState(() {
      resultado = 'Média: ${media.toStringAsFixed(1)}\nSituação: $situacao';
    });
  }

  void limpar() {
    nota1Controller.clear();
    nota2Controller.clear();
    nota3Controller.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    nota1Controller.dispose();
    nota2Controller.dispose();
    nota3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercício 5 - Calculadora de média')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nota1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nota 1'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: nota2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nota 2'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: nota3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nota 3'),
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