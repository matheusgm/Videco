import '../models/userData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService {
  static String uid;
  UserDatabaseService();

  // collection reference
  final CollectionReference userDataCollection =
      Firestore.instance.collection('usuarios');

  Future<void> updateUserData(UserData userData) async {
    return await userDataCollection.document(uid).setData(userData.toJson());
  }

  UserData _newUserData(data) {
    return UserData(
      nome: data['nome'].toString().trim(),
      dataNascimento: data['dataNascimento'].toString().trim(),
      exp: int.parse(data['experiencia'].toString()),
      level: int.parse(data['level'].toString()),
    );
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return _newUserData(snapshot.data);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userDataCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  Future<UserData> getUserData() async {
    var data = await userDataCollection.document(uid).get();
    return _newUserData(data.data);
  }
}
