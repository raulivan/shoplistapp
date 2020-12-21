import 'package:flutter/material.dart';
import 'package:shoplistapp/controllers/home_controller.dart';
import 'package:shoplistapp/views/components/card_item/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = new HomeController();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() {
    _controller.atualizarItens().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart),
            SizedBox(width: 5),
            Text('Shop List App')
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.account_box),
              onPressed: () {
                _controller.gerenciarConta(context);
              }),
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                _controller.sair(context);
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 108, 99, 255),
        child: Icon(Icons.add),
        onPressed: () {
          _controller.criarNovoItem(context);
          carregarDados();
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          carregarDados();
        },
        child: ListView.builder(
            itemCount: _controller.itens.length,
            itemBuilder: (context, index) {
              print('Executou');
              return CardItem(
                image: Image.network(_controller.itens[index].foto),
                nome: _controller.itens[index].nome,
                unidades: _controller.itens[index].unidades,
                valor: _controller.itens[index].valor,
                uid: _controller.itens[index].id,
                urlImage: _controller.itens[index].foto,
                onDelete: (uid) {
                  _controller.excluirItem(uid);
                },
                onRefresh: () {
                  carregarDados();
                },
              );
            }),
      ),
    );
  }
}
