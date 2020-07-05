import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import '../../design/bezier_curves.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new MyHomePage(),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
          child: new Scaffold(
          body: new FlutterMap(
              options: new MapOptions(
                  center: new LatLng(-22.955934, -43.231863), minZoom: 1.0),
              layers: [
            new TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/paulo-bessa/ckblujxew0m5o1imqlwxlshoc/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicGF1bG8tYmVzc2EiLCJhIjoiY2tibHR6bTZpMWNyajJubXgybjR6cG9zYSJ9.t_1EcCOx-qeWZhUA3bw8DA",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoicGF1bG8tYmVzc2EiLCJhIjoiY2tibHR6bTZpMWNyajJubXgybjR6cG9zYSJ9.t_1EcCOx-qeWZhUA3bw8DA',
                  'id': 'ckbmmchp408rn1mozbzat5ctv'
                }),
            new MarkerLayerOptions(markers: [
              new Marker(
                  width: 45.0,
                  height: 45.0,
                  point: new LatLng(-22.940825, -43.200521),
                  builder: (context) => new Container(
                        child: IconButton(
                          icon: Icon(Icons.location_on),
                          color: Colors.red,
                          iconSize: 45.0,
                          onPressed: () {
                            print('Marker tapped');
                          },
                        ),
                      )),
              new Marker(
                  width: 45.0,
                  height: 45.0,
                  point: new LatLng(-22.936565, -43.187867),
                  builder: (context) => new Container(
                        child: IconButton(
                          icon: Icon(Icons.location_on),
                          color: Colors.red,
                          iconSize: 45.0,
                          onPressed: () {
                            print('Marker tapped');
                          },
                        ),
                      )),
              new Marker(
                  width: 45.0,
                  height: 45.0,
                  point: new LatLng(-22.936092, -43.185951),
                  builder: (context) => new Container(
                        child: IconButton(
                          icon: Icon(Icons.location_on),
                          color: Colors.red,
                          iconSize: 45.0,
                          onPressed: () {
                            print('Marker tapped');
                          },
                        ),
                      ))
            ])
          ])),
          clipper: BottomWaveClipper2(),
    );
  }
}
