import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioProvider {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Incluir
  Future<void> incluir(Map map) async {
    await _firestore.collection('usuarios').add(map);
  }

  //Excluir
  Future<void> excluir(Map map) async {
    QuerySnapshot qs = await _firestore
        .collection('usuarios')
        .where('email', isEqualTo: map['email'])
        .get();

    await _firestore.collection('usuarios').doc(qs.docs.last.id).delete();
  }

  //Selecionar
  Future<Map> selecionarPorEmail(String email) async {
    var qs = await _firestore
        .collection('usuarios')
        .where('email', isEqualTo: email)
        .get();

    return qs.docs.length > 0 ? qs.docs[0].data() : [];
  }

  //Alterar
  Future<void> alterar(Map map) async {
    QuerySnapshot qs = await _firestore
        .collection('usuarios')
        .where('email', isEqualTo: map['email'])
        .get();

    await _firestore.collection('usuarios').doc(qs.docs.last.id).update(map);
  }
}
