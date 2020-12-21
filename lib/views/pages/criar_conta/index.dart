import 'package:flutter/material.dart';
import 'package:shoplistapp/controllers/criar_conta_controller.dart';
import 'package:shoplistapp/views/components/flat_button_ext/index.dart';
import 'package:shoplistapp/views/components/text_form_field_ext/index.dart';

class CriarContaPge extends StatefulWidget {
  @override
  _CriarContaPgeState createState() => _CriarContaPgeState();
}

class _CriarContaPgeState extends State<CriarContaPge> {
  final _formKey = GlobalKey<FormState>();
  final _controller = new CriarContaController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_box),
            SizedBox(width: 5),
            Text('Criar Conta')
          ],
        ),
      ),
      body: Center(
        child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 100,
                  child: Image.asset('assets/images/novo.png'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
                  child: TextFormFieldExt(
                      labelText: 'Nome',
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.contact_mail),
                      controller: _controller.nomeController,
                      validator: (text) {
                        if (text.trim().length == 0)
                          return 'Nome não informado';
                      }),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                  child: TextFormFieldExt(
                      labelText: 'E-mail',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email),
                      controller: _controller.emailController,
                      validator: (text) {
                        if (text.trim().length == 0)
                          return 'E-mail não informado';
                      }),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                  child: TextFormFieldExt(
                      labelText: 'Senha',
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(Icons.vpn_key),
                      obscureText: true,
                      controller: _controller.senhaController,
                      validator: (text) {
                        if (text.trim().length < 5)
                          return 'Senha não informada';
                      }),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                  child: FlatButtonExt(
                    text: 'Criar minha conta',
                    onPressed: () {
                      if (!_formKey.currentState.validate()) return;
                      _controller.criarConta(context);
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
