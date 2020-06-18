class UserData {
  String nome;
  String dataNascimento;
  int exp;
  int level;

  UserData({
    this.nome,
    this.dataNascimento,
    this.exp = 0,
    this.level = 1,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['dataNascimento'] = this.dataNascimento;
    data['experiencia'] = this.exp;
    data['level'] = this.level;
    return data;
  }
}
