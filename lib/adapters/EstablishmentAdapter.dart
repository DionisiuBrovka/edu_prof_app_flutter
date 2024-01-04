import 'package:edu_prof_app_flutter/api/ApiController.dart';
import 'package:edu_prof_app_flutter/models/Establishment.dart';
import 'package:edu_prof_app_flutter/screens/EstablishmentsDetailPage.dart';
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
      child: InkWell(
        onTap: () => {
          Navigator.of(context).push(MaterialPageRoute<dynamic>(
            builder: (BuildContext context) {
              return EstablishmentsDetailPage(
                uID: widget.establishment.id,
                title: widget.establishment.title,
              );
            },
          ))
        },
        child: ListTile(
          leading: EstablishmentAdapterLeading(widget: widget),
          title: Text(widget.establishment.title),
          subtitle: Text(widget.establishment.adress),
          subtitleTextStyle: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: const Color.fromARGB(255, 120, 120, 120)),
        ),
      ),
    );
  }
}

class EstablishmentAdapterLeading extends StatelessWidget {
  const EstablishmentAdapterLeading({
    super.key,
    required this.widget,
  });

  final EstablishmentAdapter widget;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Image.network(
          "${ApiController.apiRootUristring}${widget.establishment.icon}",
          fit: BoxFit.cover,
          errorBuilder: (context, obj, e) {
            return Image.asset(
              'assets/no-photo.png',
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
