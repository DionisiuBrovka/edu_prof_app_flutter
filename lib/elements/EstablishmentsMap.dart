import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:edu_prof_app_flutter/screens/EstablishmentsDetailPage.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class EstablishmentsMap extends StatefulWidget {
  const EstablishmentsMap({super.key});

  @override
  State<EstablishmentsMap> createState() => _EstablishmentsMapState();
}

class _EstablishmentsMapState extends State<EstablishmentsMap>
    with TickerProviderStateMixin {
  late final _animatedMapController = AnimatedMapController(vsync: this);

  Establishment? _selectedEstablishment;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _animatedMapController.mapController,
      options: MapOptions(
        initialCenter: const LatLng(53.9, 27.5667),
        initialZoom: 11,
        cameraConstraint: CameraConstraint.contain(
          bounds: LatLngBounds(
            const LatLng(-90, -180),
            const LatLng(90, 180),
          ),
        ),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        FutureBuilder(
            future: Establishment.getAllObjectsList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MarkerLayer(
                  markers: snapshot.data!
                      .map((e) => Marker(
                            width: 45,
                            height: 45,
                            point: LatLng(e.latitude!, e.longitude!),
                            child: IconButton(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(0),
                              iconSize: 45,
                              onPressed: () {
                                _animatedMapController.centerOnPoint(
                                    LatLng(e.latitude!, e.longitude!),
                                    zoom: 15);
                                setState(() {
                                  _selectedEstablishment = e;
                                });
                              },
                              icon: Icon(
                                Icons.place,
                                color: ((_selectedEstablishment != null) &&
                                        (_selectedEstablishment!.id == e.id))
                                    ? const Color.fromARGB(255, 239, 31, 16)
                                    : const Color.fromARGB(255, 63, 137, 255),
                                shadows: const [
                                  Shadow(color: Colors.black, blurRadius: 5)
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
        _selectedEstablishment != null
            ? Card(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: InkWell(
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) {
                        return EstablishmentsDetailPage(
                          uID: _selectedEstablishment!.id,
                          title: _selectedEstablishment!.title,
                        );
                      },
                    ))
                  },
                  child: ListTile(
                    leading: ClipOval(
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Image.network(
                          "https://eduapp.dionisiubrovka.online/${_selectedEstablishment!.icon}",
                          fit: BoxFit.cover,
                          errorBuilder: (context, obj, e) {
                            return Image.asset(
                              'assets/no-photo.png',
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                    title: Text(_selectedEstablishment!.title),
                    subtitle: Text(_selectedEstablishment!.adress),
                    subtitleTextStyle: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                            color: const Color.fromARGB(255, 120, 120, 120)),
                  ),
                ),
              )
            : const Center()
      ],
    );
  }
}
