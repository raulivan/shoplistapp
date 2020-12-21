import 'package:shoplistapp/data/models/item_model.dart';
import 'package:shoplistapp/data/providers/item_provider.dart';

class ItemRepository {
  static final _provider = new ItemProvider();

  Future<bool> incluir(ItemModel item) async {
    try {
      await _provider.incluir(item.toMap());
      return false;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<bool> alterar(ItemModel item) async {
    try {
      await _provider.alterar(item.toMap());
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<bool> excluir(ItemModel item) async {
    try {
      await _provider.excluir(item.id);
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<List<ItemModel>> selecionarTodos() async {
    try {
      var map = await _provider.selecionarTodos();
      var lista = new List<ItemModel>();
      for (int i = 0; i < map.length; i++) {
        lista.add(ItemModel.fromMap(map[i]));
      }
      return lista;
    } catch (ex) {
      print(ex);
      return null;
    }
  }
}
