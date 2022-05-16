import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutterapp/models/userData.dart';

class GraficoN extends StatefulWidget {
  final data0;

  GraficoN(this.data0); // CONSTRUCAO DO CONTRUTOR

  @override
  _GraficoNState createState() => _GraficoNState();
}

class _GraficoNState extends State<GraficoN> {
  UserData data0;

  List<charts.Series<Task, String>> _seriesPieData;
  generateData() {
    var pieData = [
      // new Task('p', 50.3, Color(0xff3366cc)),
      new Task(
          'p',
          // double.parse(data0.exp.toString()) - 200 * (data0.level - 1),,
          360,
          Colors.lightGreen[700]),
      new Task(
          's',
          // 200 + (data0.level - 1) * 200 - double.parse(data0.exp.toString()),
          90,
          Color.fromRGBO(0, 0, 0, 0.8)),
    ];
    _seriesPieData.add(charts.Series(
      data: pieData,
      domainFn: (Task task, _) => task.task,
      measureFn: (Task task, _) => task.taskvalue,
      colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.colorval),
      id: 'Daily Task',
    ));
  }

  @override
  void initState() {
    super.initState();
    data0 = widget.data0;
    _seriesPieData = List<charts.Series<Task, String>>();
    generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: charts.PieChart(
        _seriesPieData,
        animate: true,
        animationDuration: Duration(seconds: 1),
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 20),
      ),
    );
  }
}

class GraficoCO2 extends StatefulWidget {
  final data_1;

  GraficoCO2(this.data_1); // CONSTRUCAO DO CONTRUTOR

  @override
  _GraficoCO2State createState() => _GraficoCO2State();
}

class _GraficoCO2State extends State<GraficoCO2> {
  UserData data_1;

  List<charts.Series<CO2, String>> _seriesData;
  generateData() {
    var columndata1 = [
      new CO2('04', 2.4, Colors.brown[100]),
      new CO2('05', 5.0, Colors.brown[400]),
      new CO2('06', 7.0, Colors.brown[700]),
    ];

    _seriesData.add(charts.Series(
      domainFn: (CO2 co2, _) => co2.pessoa,
      measureFn: (CO2 co2, _) => co2.quantidade,
      id: '2020',
      data: columndata1,
      fillPatternFn: (_, __) => charts.FillPatternType.solid,
      colorFn: (CO2 co2, _) => charts.ColorUtil.fromDartColor(co2.colorval),
    ));
  }

  @override
  void initState() {
    super.initState();
    data_1 = widget.data_1;
    _seriesData = List<charts.Series<CO2, String>>();
    generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      child: charts.BarChart(
        _seriesData,
        animate: true,
        animationDuration: Duration(seconds: 1),
        barGroupingType: charts.BarGroupingType.grouped,
      ),
    );
  }
}

class GraficoAGUA extends StatefulWidget {
  final data_2;

  GraficoAGUA(this.data_2); // CONSTRUCAO DO CONTRUTOR

  @override
  _GraficoAGUAState createState() => _GraficoAGUAState();
}

class _GraficoAGUAState extends State<GraficoAGUA> {
  UserData data_2;

  List<charts.Series<AGUA, String>> _seriesData1;
  generateData() {
    var columndata2 = [
      new AGUA('04', 2.4, Colors.blue[100]),
      new AGUA('05', 5.0, Colors.blue[400]),
      new AGUA('06', 7.0, Colors.blue[700]),
    ];

    _seriesData1.add(charts.Series(
      domainFn: (AGUA agua, _) => agua.pessoa,
      measureFn: (AGUA agua, _) => agua.quantidade,
      id: '2020',
      data: columndata2,
      fillPatternFn: (_, __) => charts.FillPatternType.solid,
      colorFn: (AGUA agua, _) => charts.ColorUtil.fromDartColor(agua.colorval),
    ));
  }

  @override
  void initState() {
    super.initState();
    data_2 = widget.data_2;
    _seriesData1 = List<charts.Series<AGUA, String>>();
    generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      child: charts.BarChart(
        _seriesData1,
        animate: true,
        animationDuration: Duration(seconds: 1),
        barGroupingType: charts.BarGroupingType.grouped,
      ),
    );
  }
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class CO2 {
  String pessoa;
  double quantidade;
  Color colorval;

  CO2(this.pessoa, this.quantidade, this.colorval);
}

class AGUA {
  String pessoa;
  double quantidade;
  Color colorval;

  AGUA(this.pessoa, this.quantidade, this.colorval);
}
