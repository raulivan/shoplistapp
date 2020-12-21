import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:shoplistapp/data/models/item_model.dart';
import 'package:shoplistapp/data/providers/cloud_firestore_provider.dart';
import 'package:shoplistapp/data/repositories/item_repository.dart';
import 'package:shoplistapp/views/components/dialog_box/index.dart';

class ItemController {
  final _repository = new ItemRepository();

  final uidController = new TextEditingController();
  final nomeController = new TextEditingController();
  final unidadesController = new TextEditingController();
  final valorController = new MoneyMaskedTextController(leftSymbol: 'R\$');
  final fotoController = new TextEditingController();

  void salvar(BuildContext context) async {
    var dialogo = new DialogBox();
    if (nomeController.text.trim().length == 0) {
      dialogo.showWarning(context,
          titulo: 'ATENÇÃO', texto: 'Nome não informado');
      return;
    }

    if (unidadesController.text.trim().length == 0) {
      dialogo.showWarning(context,
          titulo: 'ATENÇÃO', texto: 'Unidades não informada');
      return;
    }

    if (valorController.text.trim().length == 0) {
      dialogo.showWarning(context,
          titulo: 'ATENÇÃO', texto: 'Valor não informado');
      return;
    }

    var item = new ItemModel(
        foto: fotoController.text,
        id: uidController.text,
        nome: nomeController.text,
        unidades: int.parse(unidadesController.text),
        valor: valorController.numberValue);

    if (item.foto != null && !item.foto.contains('http')) {
      var cfsp = new CloudFireStoreProvider();
      item.foto = await cfsp.upload(item.foto);
    }
    //CloudFireStoreprovider
    if ((item.id == null) || (item.id.trim().length == 0))
      await _repository.incluir(item);
    else
      await _repository.alterar(item);

    Navigator.of(context).pop();
  }
}
