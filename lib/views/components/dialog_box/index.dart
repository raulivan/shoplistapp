import 'package:flutter/material.dart';

class DialogBox {
  void showOK(BuildContext context,
      {@required String titulo, @required String texto}) {
    var btnOK = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        });

    var alerta = AlertDialog(
      title: Row(
        children: [
          Icon(Icons.warning),
          SizedBox(
            width: 5,
          ),
          Text(texto)
        ],
      ),
      content: Text(titulo),
      actions: [
        btnOK,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  void showWarning(BuildContext context,
      {@required String titulo, @required String texto}) {
    var btnOK = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        });

    var alerta = AlertDialog(
      title: Row(
        children: [
          Icon(Icons.warning),
          SizedBox(
            width: 5,
          ),
          Text(titulo)
        ],
      ),
      content: Text(texto),
      actions: [
        btnOK,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  void showConfirm(
    BuildContext context, {
    @required String titulo,
    @required String texto,
    @required VoidCallback simOnClick,
    @required VoidCallback naoOnClick,
  }) {
    var btnSim = FlatButton(
        child: Text("Sim"),
        onPressed: () {
          Navigator.of(context).pop();
          simOnClick();
        });

    var btnNao = FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
          naoOnClick();
        },
        child: Text('Não'));

    var alerta = AlertDialog(
      title: Row(
        children: [
          Icon(Icons.question_answer),
          SizedBox(
            width: 5,
          ),
          Text(titulo)
        ],
      ),
      content: Text(texto),
      actions: [btnSim, btnNao],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
