import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class CloudFireStoreProvider {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> upload(String caminho) async {
    var nome = caminho.split('/')[caminho.split('/').length - 1];
    var storageReference = firebaseStorage.ref().child('produtos/$nome');
    var imagem = File(caminho);
    UploadTask task = storageReference.putFile(imagem);
    await task;
    var urlFoto = await storageReference.getDownloadURL();

    return urlFoto;
  }
}
