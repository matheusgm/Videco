import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/models/metaUsuario.dart';

import 'userDatabase.dart';

class MetaUsuarioDatabaseService {
  MetaUsuarioDatabaseService();

  // collection reference
  final CollectionReference metaUsuarioCollection =
      Firestore.instance.collection('metas_usuarios');

  Future<void> metaUsuarioCreate(MetaUsuario metaUsuario) async {
    return await metaUsuarioCollection.document().setData(metaUsuario.toJson());
  }

  Future<void> metaUsuarioUpdate(MetaUsuario metaUsuario) async {
    return await metaUsuarioCollection
        .document(metaUsuario.id)
        .setData(metaUsuario.toJson());
  }

  // brew list from snapshot
  List<MetaUsuario> _metaUsuarioListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return MetaUsuario(
          id: doc.documentID,
          userID: doc.data['userId'] ?? '',
          metaID: doc.data['metaId'] ?? '',
          qntAtual: doc.data['quantidade_atual'] ?? 0,
          qntTotal: doc.data['quantidade_total'] ?? 0);
    }).toList();
  }

  // get brews stream
  Stream<List<MetaUsuario>> get metaUsuario {
    return metaUsuarioCollection
        .orderBy("metaId", descending: false)
        .snapshots()
        .map(_metaUsuarioListFromSnapshot);
  }

  
}
