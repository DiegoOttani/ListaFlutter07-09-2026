import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaVendas(),
    );
  }
}

class TelaVendas extends StatefulWidget {
  @override
  _TelaVendasState createState() => _TelaVendasState();
}

class _TelaVendasState extends State<TelaVendas> {
  final produtoController = TextEditingController();
  final precoController = TextEditingController();
  final quantidadeController = TextEditingController();

  String resultado = '';

  void calcular() {
    String produto = produtoController.text;
    double? preco = double.tryParse(precoController.text);
    int? quantidade = int.tryParse(quantidadeController.text);

    if (preco == null || quantidade == null) {
      setState(() {
        resultado = 'Preencha preço e quantidade corretamente!';
      });
      return;
    }

    double subtotal = preco * quantidade;
    double desconto = 0;

    if (subtotal > 500) {
      desconto = subtotal * 0.10;
    }

    double total = subtotal - desconto;

    setState(() {
      resultado = 'Produto: $produto\n'
          'Quantidade: $quantidade\n'
          'Subtotal: R\$ ${subtotal.toStringAsFixed(2)}\n'
          'Desconto: R\$ ${desconto.toStringAsFixed(2)}\n'
          'Total: R\$ ${total.toStringAsFixed(2)}';
    });
  }

  void limpar() {
    produtoController.clear();
    precoController.clear();
    quantidadeController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    produtoController.dispose();
    precoController.dispose();
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercício 9 - Sistema de vendas')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: produtoController,
              decoration: InputDecoration(labelText: 'Nome do produto'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Preço unitário'),
            ),
            SizedBox(height: 10),
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