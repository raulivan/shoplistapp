import 'package:flutter/material.dart';
import 'package:shoplistapp/data/repositories/login_repository.dart';
import 'package:shoplistapp/routes/app_routes.dart';
import 'package:shoplistapp/views/components/dialog_box/index.dart';

class LoginController {
  final _repository = LoginRepository();

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  void entrar(BuildContext context) async {
    var dialog = new DialogBox();

    if (emailController.text.trim().length == 0) {
      dialog.showWarning(context,
          titulo: 'ATENÇÃO!', texto: 'E-mail não informado!');
    }

    if (senhaController.text.trim().length < 5) {
      dialog.showWarning(context, titulo: 'ATENÇÃO!', texto: 'Senha inválida');
    }

    var login = await _repository.efetuarLogin(
        emailController.text, senhaController.text);

    if (login == null)
      dialog.showWarning(context, titulo: 'ATENÇÃO!', texto: 'Login inválido!');
    else
      Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
  }

  void recuperarSenha(BuildContext context) async {
    var dialog = new DialogBox();
    if (emailController.text.trim().length == 0) {
      dialog.showWarning(context,
          titulo: 'ATENÇÃO!', texto: 'E-mail não informado!');
    }
    _repository.recuperarSenha(emailController.text);
    dialog.showOK(
      context,
      titulo: 'ATENÇÃO!',
      texto: 'Foi enviado um e-mail de recuperação de senha. Verifique',
    );
  }

  void criarConta(BuildContext context) async {
    Navigator.of(context).pushNamed(AppRoutes.CRIAR_CONTA);
  }
}
