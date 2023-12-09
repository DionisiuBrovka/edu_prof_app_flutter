import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:flutter/material.dart';

class EstablishmentAdapter extends StatefulWidget {
  const EstablishmentAdapter({super.key, required this.establishment});

  final Establishment establishment;

  @override
  State<EstablishmentAdapter> createState() => _EstablishmentAdapterState();
}

class _EstablishmentAdapterState extends State<EstablishmentAdapter> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: ListTile(
        leading: ClipOval(
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Image.network(
              "https://eduapp.dionisiubrovka.online/${widget.establishment.icon}",
              fit: BoxFit.cover,
              errorBuilder: (context, obj, e) {
                return Image.asset(
                  'assets/header-back.png',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
        title: Text(widget.establishment.title),
        subtitle: Text(widget.establishment.adress),
        subtitleTextStyle: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: const Color.fromARGB(255, 120, 120, 120)),
        // trailing: IconButton(
        //   icon: widget.establishment.isFavorite
        //       ? const Icon(Icons.star_rate)
        //       : const Icon(Icons.star_border),
        //   onPressed: () {
        //     setState(() {
        //       widget.establishment.isFavorite =
        //           !widget.establishment.isFavorite;
        //     });
        //   },
        // ),
      ),
    );
  }
}
