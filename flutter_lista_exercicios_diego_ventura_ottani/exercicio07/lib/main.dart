import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaReajuste(),
    );
  }
}

class TelaReajuste extends StatefulWidget {
  @override
  _TelaReajusteState createState() => _TelaReajusteState();
}

class _TelaReajusteState extends State<TelaReajuste> {
  final nomeController = TextEditingController();
  final salarioController = TextEditingController();
  final percentualController = TextEditingController();

  String resultado = '';

  void calcular() {
    String nome = nomeController.text;
    double? salario = double.tryParse(salarioController.text);
    double? percentual = double.tryParse(percentualController.text);

    if (salario == null || percentual == null) {
      setState(() {
        resultado = 'Preencha salário e percentual corretamente!';
      });
      return;
    }

    double aumento = salario * percentual / 100;
    double novoSalario = salario + aumento;

    setState(() {
      resultado = 'Funcionário: $nome\n'
          'Salário atual: R\$ ${salario.toStringAsFixed(2)}\n'
          'Aumento: R\$ ${aumento.toStringAsFixed(2)}\n'
          'Novo salário: R\$ ${novoSalario.toStringAsFixed(2)}';
    });
  }

  void limpar() {
    nomeController.clear();
    salarioController.clear();
    percentualController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    salarioController.dispose();
    percentualController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercício 7 - Reajuste salarial')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome do funcionário'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: salarioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Salário atual'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: percentualController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Percentual de reajuste (%)'),
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
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}