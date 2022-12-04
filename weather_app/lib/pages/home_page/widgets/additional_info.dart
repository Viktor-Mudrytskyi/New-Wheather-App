import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/models/wheather_model/wheather_model.dart';
import 'package:weather_app/pages/home_page/widgets/additional_info_item.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot<Forecast?> snapshot;

  @override
  Widget build(BuildContext context) {
    var pressure = snapshot.data!.list![0].pressure! * 0.75;
    var humidity = snapshot.data!.list![0].humidity!;
    var wind = snapshot.data!.list![0].speed!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AdditionalInfoItem(
          icon: FontAwesomeIcons.temperatureThreeQuarters,
          value: pressure.round(),
          units: 'mm Hg',
        ),
        AdditionalInfoItem(
          icon: FontAwesomeIcons.cloudRain,
          value: humidity,
          units: '%',
        ),
        AdditionalInfoItem(
          icon: FontAwesomeIcons.wind,
          value: wind.round(),
          units: 'm/s',
        ),
      ],
    );
  }
}
