import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/models/metaUsuario.dart';

import 'userDatabase.dart';

class MetaUsuarioDatabaseService {
  MetaUsuarioDatabaseService();

  // collection reference
  final CollectionReference metaUsuarioCollection =
      FirebaseFirestore.instance.collection('metas_usuarios');

  Future<void> metaUsuarioCreate(MetaUsuario metaUsuario) async {
    return await metaUsuarioCollection.doc().set(metaUsuario.toJson());
  }

  Future<void> metaUsuarioUpdate(MetaUsuario metaUsuario) async {
    return await metaUsuarioCollection
        .doc(metaUsuario.id)
        .set(metaUsuario.toJson());
  }

  // brew list from snapshot
  List<MetaUsuario> _metaUsuarioListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MetaUsuario(
          id: doc.id,
          userID: doc['userId'] ?? '',
          metaID: doc['metaId'] ?? '',
          qntAtual: doc['quantidade_atual'] ?? 0,
          qntTotal: doc['quantidade_total'] ?? 0,
          dataHoraCriacao: doc['dataHoraCriacao'],
          dataHoraModificacao: doc['dataHoraModificacao']);
    }).toList();
  }

  // get brews stream
  Stream<List<MetaUsuario>> get metaUsuario {
    return metaUsuarioCollection
        .where("userId", isEqualTo: UserDatabaseService.uid)
        .orderBy("metaId", descending: false)
        .snapshots()
        .map(_metaUsuarioListFromSnapshot);
  }
}
