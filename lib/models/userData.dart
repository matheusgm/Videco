class UserData {
  final String uid;
  final String nome;
  final String dataNascimento;

  UserData({this.uid, this.nome, this.dataNascimento});

  Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['nome'] = this.nome;
      data['dataNascimento'] = this.dataNascimento;
      return data;
    }

}
