import 'package:flutter/material.dart';
import 'package:ppdm/menu.dart';
import 'cadastro.dart';

class login extends StatelessWidget {
  const login({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  TextEditingController _usernameController =
      TextEditingController(); //criando a variavel de acesso as TextField
  TextEditingController _passwordController =
      TextEditingController(); //criando a variavel de acesso as TextField
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.white, // Fundo azul
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Login',
              prefixIcon: Icon(Icons.person),
              filled: true,
              fillColor: Colors.lightGreenAccent,
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Senha',
              prefixIcon: Icon(Icons.lock),
              filled: true,
              fillColor: Colors.lightGreenAccent,
            ),
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_usernameController.text == 'admin' &&
                  _passwordController.text == 'admin') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Seja Bem-vindo')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Usuário/senha inválido(s)')),
                );
              }
              Navigator.push(
                  // Navega para a Tela2
                  context,
                  MaterialPageRoute(builder: (context) => const tela1()));
            },
            child: const Text('Entrar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white, // Cor de fundo do botão
              textStyle: TextStyle(fontSize: 18), // Estilo do texto
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20), // Espaçamento interno
              minimumSize: Size(100, 0), // Largura mínima do botão
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Borda arredondada
              ),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            // Botão elevado que leva para a Tela2
            child: const Text('Criar conta!'), // Texto exibido no botão
            onPressed: () {
              // Ação ao pressionar o botão
              Navigator.push(
                  // Navega para a Tela2
                  context,
                  MaterialPageRoute(builder: (context) => const cadastro()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white, // Cor de fundo do botão
              textStyle: TextStyle(fontSize: 18), // Estilo do texto
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20), // Espaçamento interno
              minimumSize: Size(100, 0), // Largura mínima do botão
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Borda arredondada
              ),
            ),
          ),
        ],
      ),
    );
  }
}
