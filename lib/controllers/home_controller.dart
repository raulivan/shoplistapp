import 'package:flutter/cupertino.dart';
import 'package:shoplistapp/data/models/item_model.dart';
import 'package:shoplistapp/data/providers/fire_base_auth_provider.dart';
import 'package:shoplistapp/data/repositories/item_repository.dart';
import 'package:shoplistapp/routes/app_routes.dart';

class HomeController {
  final _itemRepository = new ItemRepository();
  List<ItemModel> itens = new List<ItemModel>();

  void gerenciarConta(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.CONTA);
  }

  void sair(BuildContext context) {
    final auth = new FireBaseAuthProvider();
    auth.efetuarLogoff();
    Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
  }

  void criarNovoItem(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.ITEM);
  }

  Future<void> atualizarItens() async {
    itens.clear();
    itens = await _itemRepository.selecionarTodos();
  }

  void excluirItem(String uid) async {
    await _itemRepository.excluir(new ItemModel(id: uid));
  }
}
