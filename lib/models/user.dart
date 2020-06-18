class User {
  String uid;
  String email;
  int exp;
  int level;
  int diasMeta1;
  int diasMeta2;
  int diasMeta3;
  int diasMeta4;

  User({this.uid, this.email});

  /* User.fromJson(Map<String, dynamic> json) {
    //uid = json['uid'];
    nome = json['nome'];
    email = json['email'];
    //password = json['password'];
    dataNascimento = json['dataNascimento'];

  } */

  /* void fromJson(Map<String, dynamic> json){
    //this.uid = json['uid'];
    this.nome = json['nome'];
    this.email = json['email'];
    //this.password = json['password'];
    this.dataNascimento = json['dataNascimento']; 
  }*/

  /* Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    //data['password'] = this.password;
    data['dataNascimento'] = this.dataNascimento;
    return data;
  } */
}
