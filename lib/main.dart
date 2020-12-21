import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoplistapp/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FirebaseAppInit());
}

class FirebaseAppInit extends StatelessWidget {
  //Inicializa o Firebase
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Verifica se tem erros
        if (snapshot.hasError) {
          return Container(
            child: Center(
              child: Text('Ocorreu erro ao inicializar o Firebase'),
            ),
          );
        }

        // Se tudo der certo abre a aplicação
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Mostrar carregando
        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop List App',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 108, 99, 255),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.LOGIN,
      routes: AppRoutes.routes,
    );
  }
}
