import '../util.dart';
import 'meta.dart';

class MetaUsuario {
  String id;
  String userID;
  String metaID;
  Meta meta;
  int qntAtual;
  int qntTotal;
  String dataHoraModificacao;
  String dataHoraCriacao;

  MetaUsuario({
    this.id,
    this.metaID,
    this.userID,
    this.meta,
    this.qntAtual = 0,
    this.qntTotal = 0,
    this.dataHoraCriacao,
    this.dataHoraModificacao,
  }) {
    if (this.dataHoraCriacao == null && this.dataHoraModificacao == null) {
      var dataTime = getDateTimeNow();
      this.dataHoraModificacao = dataTime;
      this.dataHoraCriacao = dataTime;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userID;
    data['metaId'] = this.metaID;
    data['quantidade_atual'] = this.qntAtual;
    data['quantidade_total'] = this.qntTotal;
    data['dataHoraModificacao'] = this.dataHoraModificacao;
    data['dataHoraCriacao'] = this.dataHoraCriacao;
    return data;
  }
}
