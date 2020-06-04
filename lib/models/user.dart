class User {

  String uid;
  String nome;
  String email;
  String password;
  String dataNascimento;

  User({ this.uid });

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    nome = json['nome'];
    email = json['email'];
    password = json['password'];
    dataNascimento = json['dataNascimento'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    //data['password'] = this.password;
    data['dataNascimento'] = this.dataNascimento;
    return data;
  }
}