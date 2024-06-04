import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'cadastromed.dart';
import 'login.dart';
import 'cadastro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rotas nomeadas',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const login(),
        '/cadastro': (context) => const cadastro(),
        '/cadastromed': (context) => const TaskListScreen(),
      },
    );
  }
}
class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('login'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logo.png'),
              fit:BoxFit.cover,
            ),
          ),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )

    );
  }
}
