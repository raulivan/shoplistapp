import 'package:shoplistapp/data/models/usuario_model.dart';
import 'package:shoplistapp/data/providers/fire_base_auth_provider.dart';
import 'package:shoplistapp/data/providers/usuario_provider.dart';

class UsuarioRepository {
  static final UsuarioProvider _provider = new UsuarioProvider();
  static final _auth = new FireBaseAuthProvider();

  Future<bool> incluir(UsuarioModel usuario) async {
    try {
      var map_login = await _auth.criarUsuario(usuario.email, usuario.senha);
      if (map_login != null) {
        usuario.loginid = map_login['id'];
        await _provider.incluir(usuario.toMap());
        return true;
      }
      return false;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<bool> alterar(UsuarioModel usuario) async {
    try {
      await _provider.alterar(usuario.toMap());
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<bool> excluir(UsuarioModel usuario) async {
    try {
      await _provider.excluir(usuario.toMap());
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<UsuarioModel> selecionarPorEmail(String email) async {
    try {
      var map = await _provider.selecionarPorEmail(email);
      if (map.length > 0) return UsuarioModel.fromMap(map);
      return null;
    } catch (ex) {
      print(ex);
      return null;
    }
  }
}
