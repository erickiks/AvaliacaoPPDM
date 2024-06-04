import 'package:flutter/material.dart';
import 'cadastromed.dart';

class tela1 extends StatelessWidget {
  const tela1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Primeira tela "Rota" '),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/TaskListScreen');
              },
              child: const Text('cadastro medico'),
            ),
          ],
        ),
      ),
    );
  }
}
