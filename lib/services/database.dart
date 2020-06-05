import '../models/userData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userDataCollection =
      Firestore.instance.collection('usuarios');

  Future<void> updateUserData(String nome, String dataNascimento) async {
    return await userDataCollection.document(uid).setData({
      'nome': nome,
      'dataNascimento': dataNascimento,
    });
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      nome: snapshot.data['nome'].toString().trim(),
      dataNascimento: snapshot.data['dataNascimento'].toString().trim(),
    );
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userDataCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
