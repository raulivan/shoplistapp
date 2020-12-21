import 'package:flutter/material.dart';
import 'package:shoplistapp/data/models/item_model.dart';
import 'package:shoplistapp/views/pages/item/index.dart';

class CardItem extends StatelessWidget {
  Image image;
  String nome;
  int unidades;
  double valor;
  String urlImage;
  String uid;
  Function(String uid) onDelete;
  Function onRefresh;
  CardItem(
      {this.image,
      this.nome,
      this.unidades,
      this.valor,
      this.urlImage,
      this.uid,
      this.onDelete,
      this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: InkWell(
        onTap: () async {
          var item = new ItemModel(
            foto: this.urlImage,
            id: this.uid,
            nome: this.nome,
            unidades: this.unidades,
            valor: this.valor,
          );

          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new ItemPage(
                        dadosIniciais: item,
                      )));
          onRefresh();
        },
        child: Dismissible(
          key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
          background: Container(
            color: Colors.red,
            child: Align(
              alignment: Alignment(0.9, 0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            onDelete(this.uid);
          },
          child: Card(
            elevation: 5,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 50,
                  child: this.image,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.nome,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${this.unidades.toStringAsFixed(0)} unidade(s)',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'R\$ ${this.valor.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
