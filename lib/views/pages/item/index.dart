import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoplistapp/controllers/item_controller.dart';
import 'package:shoplistapp/data/models/item_model.dart';
import 'package:shoplistapp/views/components/flat_button_ext/index.dart';
import 'package:shoplistapp/views/components/text_form_field_ext/index.dart';

class ItemPage extends StatefulWidget {
  ItemModel dadosIniciais;

  ItemPage({this.dadosIniciais});

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final _controller = new ItemController();
  final _formKey = GlobalKey<FormState>();
  final imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    iniciarDados();
  }

  void iniciarDados() {
    if (widget.dadosIniciais == null) return;
    setState(() {
      _controller.uidController.text = widget.dadosIniciais.id;
      _controller.fotoController.text = widget.dadosIniciais.foto;
      _controller.nomeController.text = widget.dadosIniciais.nome;
      _controller.unidadesController.text =
          widget.dadosIniciais.unidades.toStringAsFixed(0);
      _controller.valorController.text =
          widget.dadosIniciais.valor.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_box),
            SizedBox(width: 5),
            Text('Cadastrar Novo Item')
          ],
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: _retornaFoto(
                                    _controller.fotoController.text)),
                          )),
                    ),
                    Center(
                      child: Container(
                        color: Colors.transparent,
                        width: 250,
                        height: 190,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: PopupMenuButton<int>(
                            itemBuilder: (context) => <PopupMenuEntry<int>>[
                              const PopupMenuItem<int>(
                                child: Text('Câmera'),
                                value: 0,
                              ),
                              const PopupMenuItem<int>(
                                child: Text('Galeria'),
                                value: 1,
                              )
                            ],
                            onSelected: (valor) async {
                              final fotoSelecionada =
                                  await imagePicker.getImage(
                                      source: (valor == 0
                                          ? ImageSource.camera
                                          : ImageSource.gallery));
                              setState(() {
                                _controller.fotoController.text =
                                    fotoSelecionada.path;
                              });
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'Nome',
                  keyboardType: TextInputType.name,
                  prefixIcon: Icon(Icons.edit),
                  controller: _controller.nomeController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'Unidades',
                  keyboardType: TextInputType.number,
                  prefixIcon: Icon(Icons.edit),
                  controller: _controller.unidadesController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'Valor',
                  keyboardType: TextInputType.number,
                  prefixIcon: Icon(Icons.money),
                  controller: _controller.valorController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                child: FlatButtonExt(
                  text: 'Salvar',
                  onPressed: () {
                    _controller.salvar(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  dynamic _retornaFoto(String caminho) {
    if (caminho.length == 0) {
      return AssetImage('assets/images/sem_foto_item.png');
    } else {
      if (caminho.contains('http'))
        try {
          return NetworkImage(caminho);
        } catch (ex) {
          return AssetImage('assets/images/sem_foto_item.png');
        }
      else
        try {
          return FileImage(File(caminho));
        } catch (ex) {
          return AssetImage('assets/images/sem_foto_item.png');
        }
    }
  }
}
