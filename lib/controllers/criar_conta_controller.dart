import 'package:flutter/material.dart';
import 'package:shoplistapp/data/models/usuario_model.dart';
import 'package:shoplistapp/data/repositories/usuario_repository.dart';
import 'package:shoplistapp/routes/app_routes.dart';
import 'package:shoplistapp/views/components/dialog_box/index.dart';

class CriarContaController {
  final _repository = UsuarioRepository();

  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  void criarConta(BuildContext context) async {
    var dialog = new DialogBox();

    if (nomeController.text.trim().length < 2) {
      dialog.showWarning(context,
          titulo: 'ATENÇÃO!', texto: 'Nome não informado!');
    }

    if (emailController.text.trim().length == 0) {
      dialog.showWarning(context,
          titulo: 'ATENÇÃO!', texto: 'E-mail não informado!');
    }

    if (senhaController.text.trim().length < 5) {
      dialog.showWarning(context, titulo: 'ATENÇÃO!', texto: 'Senha inválida!');
    }

    var usuario = new UsuarioModel(
        nome: nomeController.text,
        email: emailController.text,
        senha: senhaController.text);

    var retorno = await _repository.incluir(usuario);
    if (retorno) {
      dialog.showOK(context,
          titulo: 'ATENÇÃO!', texto: 'Usuário cadastrado com sucesso');
      Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
    } else {
      dialog.showWarning(context,
          titulo: 'ATENÇÃO!', texto: 'Falha ao cadastrar o Usuário.');
    }
  }
}
