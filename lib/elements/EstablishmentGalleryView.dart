import 'package:carousel_slider/carousel_slider.dart';
import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:flutter/material.dart';

class EstablishmentGalleryView extends StatelessWidget {
  const EstablishmentGalleryView({super.key, required this.establishment});

  final Establishment establishment;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        // ignore: prefer_null_aware_operators
        items: establishment.gallery!
            .map((e) => Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(165, 0, 0, 0),
                        blurRadius: 6,
                        spreadRadius: 1)
                  ]),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.network(
                        "https://eduapp.dionisiubrovka.online/${e.photo}",
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e.desc ?? "",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          height: 300,
          aspectRatio: 4 / 3,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ));
  }
}
