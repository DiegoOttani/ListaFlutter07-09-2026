import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaTemperatura(),
    );
  }
}

class TelaTemperatura extends StatefulWidget {
  @override
  _TelaTemperaturaState createState() => _TelaTemperaturaState();
}

class _TelaTemperaturaState extends State<TelaTemperatura> {
  final celsiusController = TextEditingController();

  String resultado = '';

  void converter() {
    double? celsius = double.tryParse(celsiusController.text);

    if (celsius == null) {
      setState(() {
        resultado = 'Digite um valor válido!';
      });
      return;
    }

    double fahrenheit = (celsius * 9 / 5) + 32;

    setState(() {
      resultado = 'Temperatura em Fahrenheit: ${fahrenheit.toStringAsFixed(1)} °F';
    });
  }

  void limpar() {
    celsiusController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    celsiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercício 4 - Conversor de temperatura')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: celsiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Temperatura em Celsius'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: converter,
                  child: Text('Converter'),
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