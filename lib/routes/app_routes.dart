import 'package:shoplistapp/views/pages/conta/index.dart';
import 'package:shoplistapp/views/pages/criar_conta/index.dart';
import 'package:shoplistapp/views/pages/home/index.dart';
import 'package:shoplistapp/views/pages/item/index.dart';
import 'package:shoplistapp/views/pages/login/index.dart';

abstract class AppRoutes {
  static const String CONTA = 'CONTA';
  static const String CRIAR_CONTA = 'CRIAR_CONTA';
  static const String HOME = 'HOME';
  static const String ITEM = 'ITEM';
  static const String LOGIN = 'LOGIN';

  static final routes = {
    CONTA: (context) => ContaPage(),
    CRIAR_CONTA: (context) => CriarContaPge(),
    HOME: (context) => HomePage(),
    ITEM: (context) => ItemPage(),
    LOGIN: (context) => LoginPage(),
  };
}
