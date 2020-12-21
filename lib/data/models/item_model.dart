class ItemModel {
  String id;
  String nome;
  int unidades;
  double valor;
  String foto;

  ItemModel({this.id, this.nome, this.unidades, this.valor, this.foto});

  ItemModel.fromMap(Map map) {
    this.id = map['id'];
    this.nome = map['nome'];
    this.unidades = map['unidades'];
    this.valor = map['valor'];
    this.foto = map['foto'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'nome': this.nome,
      'unidades': this.unidades,
      'valor': this.valor,
      'foto': this.foto
    };

    return map;
  }
}
