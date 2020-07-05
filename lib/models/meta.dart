class Meta {
  String id;
  String nome;
  String descricao;
  int limite;
  int exp;

  Meta({this.id, this.nome, this.exp, this.descricao,this.limite});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['exp'] = this.exp;
    data['descricao'] = this.descricao;
    data['limite'] = this.limite;
    return data;
  }
}
