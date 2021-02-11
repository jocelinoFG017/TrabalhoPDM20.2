class Pessoa {
  int idPessoa;
  String nome;
  String email;

  Pessoa(this.idPessoa, this.nome, this.email);

  Map<String, dynamic> toMap() {
    return {'idPessoa': this.idPessoa, 'nome': this.nome, 'email': this.email};
  }

  static Pessoa fromMap(dados) {
    return Pessoa(dados['idPessoa'], dados['nome'], dados['email']);
  }
}
