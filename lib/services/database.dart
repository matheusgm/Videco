import '../models/userData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  static String uid;
  DatabaseService();

  // collection reference
  final CollectionReference userDataCollection =
      Firestore.instance.collection('usuarios');

  Future<void> updateUserData(UserData userData) async {
    return await userDataCollection.document(uid).setData(userData.toJson());
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        nome: snapshot.data['nome'].toString().trim(),
        dataNascimento: snapshot.data['dataNascimento'].toString().trim(),
        exp: int.parse(snapshot.data['experiencia'].toString()),
        level: int.parse(snapshot.data['level'].toString()));
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userDataCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
