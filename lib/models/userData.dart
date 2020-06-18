class UserData {
  final String nome;
  final String dataNascimento;
  final int exp;
  final int level;
  final int diasMeta1;
  final int diasMeta2;
  final int diasMeta3;
  final int diasMeta4;

  UserData({this.nome, this.dataNascimento, this.exp, this.level, this.diasMeta1,this.diasMeta2,this.diasMeta3,this.diasMeta4});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['dataNascimento'] = this.dataNascimento;
    data['experiencia'] = this.exp;
    data['level'] = this.level;
    data['diasMeta1'] = this.diasMeta1;
    data['diasMeta2'] = this.diasMeta2;
    data['diasMeta3'] = this.diasMeta3;
    data['diasMeta4'] = this.diasMeta4;
    return data;
  }
}
