import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapEst extends StatelessWidget {
  const MapEst({super.key});

  @override
  Widget build(BuildContext context) {
    return YandexMap(
      mapType: MapType.vector,
      mapObjects: [
        PlacemarkMapObject(
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage('assets/2032555.png'))),
            mapId: const MapObjectId('some_obj'),
            point: const Point(latitude: 53.902431, longitude: 27.557408),
            text: const PlacemarkText(
                text: "Колледж тестовая метка",
                style: PlacemarkTextStyle(offset: 70)))
      ],
      onMapCreated: (controller) {
        controller.moveCamera(CameraUpdate.newCameraPosition(
            const CameraPosition(
                target: Point(latitude: 53.902431, longitude: 27.557408),
                zoom: 11)));
      },
    );
  }
}
