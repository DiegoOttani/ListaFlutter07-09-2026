import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaConsumo(),
    );
  }
}

class TelaConsumo extends StatefulWidget {
  @override
  _TelaConsumoState createState() => _TelaConsumoState();
}

class _TelaConsumoState extends State<TelaConsumo> {
  final distanciaController = TextEditingController();
  final combustivelController = TextEditingController();

  String resultado = '';

  void calcular() {
    double? distancia = double.tryParse(distanciaController.text);
    double? litros = double.tryParse(combustivelController.text);

    if (distancia == null || litros == null || litros == 0) {
      setState(() {
        resultado = 'Preencha os campos corretamente (litros não pode ser zero)!';
      });
      return;
    }

    double consumo = distancia / litros;
    String classificacao = consumo >= 12 ? 'Econômico' : 'Consumo elevado';

    setState(() {
      resultado = 'Consumo médio: ${consumo.toStringAsFixed(1)} km/l\n'
          'Classificação: $classificacao';
    });
  }

  void limpar() {
    distanciaController.clear();
    combustivelController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    distanciaController.dispose();
    combustivelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercício 8 - Consumo de combustível')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: distanciaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Distância percorrida (km)'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: combustivelController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Combustível utilizado (litros)'),
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