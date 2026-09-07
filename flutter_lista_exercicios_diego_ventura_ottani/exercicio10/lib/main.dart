import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaEstoque(),
    );
  }
}

class TelaEstoque extends StatefulWidget {
  @override
  _TelaEstoqueState createState() => _TelaEstoqueState();
}

class _TelaEstoqueState extends State<TelaEstoque> {
  final quantidadeController = TextEditingController();

  int estoque = 0;
  String mensagem = '';

  void entrada() {
    int? quantidade = int.tryParse(quantidadeController.text);

    if (quantidade == null) {
      setState(() {
        mensagem = 'Digite uma quantidade válida!';
      });
      return;
    }

    setState(() {
      estoque = estoque + quantidade;
      mensagem = 'Entrada realizada com sucesso.';
    });
  }

  void saida() {
    int? quantidade = int.tryParse(quantidadeController.text);

    if (quantidade == null) {
      setState(() {
        mensagem = 'Digite uma quantidade válida!';
      });
      return;
    }

    if (quantidade > estoque) {
      setState(() {
        mensagem = 'Quantidade indisponível em estoque!';
      });
      return;
    }

    setState(() {
      estoque = estoque - quantidade;
      mensagem = 'Saída realizada com sucesso.';
    });
  }

  void limparCampo() {
    quantidadeController.clear();
    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercício 10 - Controle de estoque')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Quantidade atual em estoque: $estoque',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Quantidade'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: entrada,
                  child: Text('Entrada'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: saida,
                  child: Text('Saída'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: limparCampo,
                  child: Text('Limpar campo'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              mensagem,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}