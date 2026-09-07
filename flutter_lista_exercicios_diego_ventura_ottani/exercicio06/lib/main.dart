import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaCalculadora(),
    );
  }
}

class TelaCalculadora extends StatefulWidget {
  @override
  _TelaCalculadoraState createState() => _TelaCalculadoraState();
}

class _TelaCalculadoraState extends State<TelaCalculadora> {
  final numero1Controller = TextEditingController();
  final numero2Controller = TextEditingController();

  String resultado = '';

  double? pegarNumero1() => double.tryParse(numero1Controller.text);
  double? pegarNumero2() => double.tryParse(numero2Controller.text);

  void somar() {
    double? n1 = pegarNumero1();
    double? n2 = pegarNumero2();
    if (n1 == null || n2 == null) {
      setState(() => resultado = 'Preencha os dois números!');
      return;
    }
    setState(() => resultado = 'Resultado: ${n1 + n2}');
  }

  void subtrair() {
    double? n1 = pegarNumero1();
    double? n2 = pegarNumero2();
    if (n1 == null || n2 == null) {
      setState(() => resultado = 'Preencha os dois números!');
      return;
    }
    setState(() => resultado = 'Resultado: ${n1 - n2}');
  }

  void multiplicar() {
    double? n1 = pegarNumero1();
    double? n2 = pegarNumero2();
    if (n1 == null || n2 == null) {
      setState(() => resultado = 'Preencha os dois números!');
      return;
    }
    setState(() => resultado = 'Resultado: ${n1 * n2}');
  }

  void dividir() {
    double? n1 = pegarNumero1();
    double? n2 = pegarNumero2();
    if (n1 == null || n2 == null) {
      setState(() => resultado = 'Preencha os dois números!');
      return;
    }
    if (n2 == 0) {
      setState(() => resultado = 'Erro: não é possível dividir por zero!');
      return;
    }
    setState(() => resultado = 'Resultado: ${n1 / n2}');
  }

  void limpar() {
    numero1Controller.clear();
    numero2Controller.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    numero1Controller.dispose();
    numero2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercício 6 - Calculadora')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: numero1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: numero2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: somar, child: Text('+')),
                SizedBox(width: 8),
                ElevatedButton(onPressed: subtrair, child: Text('-')),
                SizedBox(width: 8),
                ElevatedButton(onPressed: multiplicar, child: Text('×')),
                SizedBox(width: 8),
                ElevatedButton(onPressed: dividir, child: Text('÷')),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: limpar,
              child: Text('Limpar'),
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