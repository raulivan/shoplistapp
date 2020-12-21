import 'package:cloud_firestore/cloud_firestore.dart';

class ItemProvider {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Incluir
  Future<void> incluir(Map map) async {
    await _firestore.collection('produtos').add(map);
  }

  //Excluir
  Future<void> excluir(String uid) async {
    await _firestore.collection('produtos').doc(uid).delete();
  }

  //Selecionar
  Future<List<Map>> selecionarTodos() async {
    var qs = await _firestore.collection('produtos').get();

    var lista = new List<Map>();

    for (int i = 0; i < qs.docs.length; i++) {
      var item = qs.docs[i].data();
      item['id'] = qs.docs[i].id;
      lista.add(item);
    }

    return lista;
  }

  //Alterar
  Future<void> alterar(Map map) async {
    await _firestore.collection('produtos').doc(map['id']).update(map);
  }
}
