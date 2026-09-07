import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaIdade(),
    );
  }
}

class TelaIdade extends StatefulWidget {
  @override
  _TelaIdadeState createState() => _TelaIdadeState();
}

class _TelaIdadeState extends State<TelaIdade> {
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();

  String resultado = '';

  void verificar() {
    String nome = nomeController.text;
    int? idade = int.tryParse(idadeController.text);

    if (idade == null) {
      setState(() {
        resultado = 'Digite uma idade válida!';
      });
      return;
    }

    if (idade >= 18) {
      setState(() {
        resultado = '$nome é maior de idade.';
      });
    } else {
      setState(() {
        resultado = '$nome é menor de idade.';
      });
    }
  }

  void limpar() {
    nomeController.clear();
    idadeController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    idadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercício 2 - Verificador de idade')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: idadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Idade'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: verificar,
                  child: Text('Verificar'),
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