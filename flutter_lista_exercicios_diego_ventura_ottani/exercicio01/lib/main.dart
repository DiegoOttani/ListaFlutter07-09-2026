import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaIdentificacao(),
    );
  }
}

class TelaIdentificacao extends StatefulWidget {
  @override
  _TelaIdentificacaoState createState() => _TelaIdentificacaoState();
}

class _TelaIdentificacaoState extends State<TelaIdentificacao> {
  final nomeController = TextEditingController();
  final cidadeController = TextEditingController();

  String mensagem = '';

  void mostrar() {
    setState(() {
      mensagem = 'Olá, ${nomeController.text}! Você mora em ${cidadeController.text}.';
    });
  }

  void limpar() {
    nomeController.clear();
    cidadeController.clear();
    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    cidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercício 1 - Identificação')),
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
              controller: cidadeController,
              decoration: InputDecoration(labelText: 'Cidade'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: mostrar,
                  child: Text('Mostrar'),
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
              mensagem,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}