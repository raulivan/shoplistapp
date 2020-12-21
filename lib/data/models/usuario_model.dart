class UsuarioModel {
  String id;
  String nome;
  String sexo;
  String email;
  String loginid;
  String senha;

  UsuarioModel(
      {this.id, this.nome, this.sexo, this.email, this.loginid, this.senha});

  UsuarioModel.fromMap(Map map) {
    this.id = map['id'];
    this.nome = map['nome'];
    this.sexo = map['sexo'];
    this.email = map['email'];
    this.loginid = map['loginid'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'nome': this.nome,
      'sexo': this.sexo,
      'email': this.email,
      'loginid': this.loginid
    };

    return map;
  }
}
