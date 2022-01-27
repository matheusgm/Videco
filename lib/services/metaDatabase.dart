import 'package:flutterapp/models/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MetaDatabaseService {
  MetaDatabaseService();

  // collection reference
  final CollectionReference metaCollection =
      FirebaseFirestore.instance.collection('metas');

  // brew list from snapshot
  List<Meta> _metaListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Meta(
          id: doc.id,
          nome: doc['nome'] ?? '',
          exp: doc['exp'] ?? 0,
          descricao: doc['descricao'] ?? '',
          limite: doc['limite'] ?? -1);
    }).toList();
  }

  // get brews stream
  Stream<List<Meta>> get meta {
    return metaCollection.snapshots().map(_metaListFromSnapshot);
  }
}
