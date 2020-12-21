import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoplistapp/controllers/login_controller.dart';
import 'package:shoplistapp/views/components/flat_button_ext/index.dart';
import 'package:shoplistapp/views/components/text_form_field_ext/index.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = new LoginController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _controller.emailController.text = 'raulivanrodrigo@gmail.com';
    _controller.senhaController.text = 'abc123';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 100,
                child: Image.asset('assets/images/logo.png'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'E-mail',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email),
                  controller: _controller.emailController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: TextFormFieldExt(
                    labelText: 'Senha',
                    keyboardType: TextInputType.text,
                    prefixIcon: Icon(Icons.vpn_key),
                    obscureText: true,
                    controller: _controller.senhaController),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                child: FlatButtonExt(
                  text: 'Entrar',
                  onPressed: () {
                    _controller.entrar(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: FlatButtonExt(
                  text: 'Esqueci a senha',
                  onPressed: () {
                    _controller.recuperarSenha(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: FlatButtonExt(
                  text: 'Criar minha conta',
                  onPressed: () {
                    _controller.criarConta(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
