import 'package:flutterapp/models/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterapp/models/userData.dart';

class MetaDatabaseService {
  MetaDatabaseService();

  // collection reference
  final CollectionReference metaCollection =
      Firestore.instance.collection('metas');

  // brew list from snapshot
  List<Meta> _metaListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Meta(
          id: doc.documentID,
          nome: doc.data['nome'] ?? '',
          exp: doc.data['exp'] ?? 0,
          descricao: doc.data['descricao'] ?? '');
    }).toList();
  }

  // get brews stream
  Stream<List<Meta>> get meta {
    return metaCollection.snapshots().map(_metaListFromSnapshot);
  }

}
