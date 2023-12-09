import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapEst extends StatefulWidget {
  const MapEst({super.key});

  @override
  State<MapEst> createState() => _MapEstState();
}

class _MapEstState extends State<MapEst> {
  List<Establishment> _points = [];

  void updatePoints() async {
    var fetch = await Establishment.fetchFromAPI();
    setState(() {
      _points = fetch;
    });
  }

  @override
  void initState() {
    updatePoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YandexMap(
      mapType: MapType.vector,
      mapObjects: _points
          .map((e) => PlacemarkMapObject(
              icon: PlacemarkIcon.single(PlacemarkIconStyle(
                  image:
                      BitmapDescriptor.fromAssetImage('assets/2032555.png'))),
              mapId: MapObjectId(e.id.toString()),
              point: const Point(latitude: 53.9, longitude: 27.5667),
              text: PlacemarkText(
                  text: e.title, style: PlacemarkTextStyle(offset: 70))))
          .toList(),
      onMapCreated: (controller) {
        controller.moveCamera(CameraUpdate.newCameraPosition(
            const CameraPosition(
                target: Point(latitude: 53.902431, longitude: 27.557408),
                zoom: 11)));
      },
    );
  }
}
