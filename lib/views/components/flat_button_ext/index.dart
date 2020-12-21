import 'package:flutter/material.dart';

class FlatButtonExt extends StatelessWidget {
  String _text;
  Function _onPressed;
  FlatButtonExt({
    String text,
    Function onPressed,
  }) {
    this._text = text;
    this._onPressed = onPressed;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: SizedBox.expand(
          child: FlatButton(
              onPressed: _onPressed,
              child: Text(_text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ))),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: Color.fromARGB(255, 108, 99, 255)),
            color: Color.fromARGB(255, 108, 99, 255)),
      ),
    );
  }
}
