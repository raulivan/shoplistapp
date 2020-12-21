import 'package:flutter/material.dart';
import 'package:shoplistapp/views/components/flat_button_ext/index.dart';
import 'package:shoplistapp/views/components/text_form_field_ext/index.dart';

class ContaPage extends StatefulWidget {
  @override
  _ContaPageState createState() => _ContaPageState();
}

class _ContaPageState extends State<ContaPage> {
  final _formKey = GlobalKey<FormState>();
  String _grupoSexo;
  String avatar = 'assets/images/masculino.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ola, Nome do usuário'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 100,
                child: Image.asset(avatar),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'Nome',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(Icons.contact_mail),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(60, 20, 50, 0),
                child: Text('Sexo:'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(60, 0, 50, 0),
                child: ListTile(
                  title: const Text('Masculino'),
                  leading: Radio(
                    value: 'M',
                    groupValue: _grupoSexo,
                    onChanged: (value) {
                      setState(() {
                        _grupoSexo = value;
                        avatar = 'assets/images/masculino.png';
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(60, 0, 50, 0),
                child: ListTile(
                  title: const Text('Feminino'),
                  leading: Radio(
                    value: 'F',
                    groupValue: _grupoSexo,
                    onChanged: (value) {
                      setState(() {
                        _grupoSexo = value;
                        avatar = 'assets/images/feminino.png';
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(60, 0, 50, 0),
                child: ListTile(
                  title: const Text('Prefiro não informar'),
                  leading: Radio(
                    value: 'N',
                    groupValue: _grupoSexo,
                    onChanged: (value) {
                      setState(() {
                        _grupoSexo = value;
                        avatar = 'assets/images/nao_informado.png';
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'E-mail',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'Senha',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(Icons.vpn_key),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                child: FlatButtonExt(
                  text: 'Salvar',
                  onPressed: () {
                    print('Clicou em criar minha conta');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                child: FlatButtonExt(
                  text: 'Excluir minha conta',
                  onPressed: () {
                    print('Clicou em Excluir minha conta');
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
