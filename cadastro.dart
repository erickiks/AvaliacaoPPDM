import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ppdm/menu.dart';

class cadastro extends StatefulWidget {
  const cadastro({super.key});
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<cadastro> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  bool _loading = false;

  Future<void> _registrar() async {
    setState(() {
      _loading = true;
    });

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      // Update user display name
      await userCredential.user!.updateDisplayName(_nameController.text.trim());

      // Navigate to another screen or show success message
    } catch (e) {
      // Show error message
      print("Error: $e");
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cadastro de Usuário'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.account_box, size: 120.0, color: Colors.lightGreen),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            _loading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 23,
                        ),
                        backgroundColor: Colors.lightGreen),
                    child: Text('Cadastrar'),
                    onPressed: () {
                      Navigator.push(
                          // Navega para a Tela2
                          context,
                          MaterialPageRoute(
                              builder: (context) => const tela1()));
                      _registrar();
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
