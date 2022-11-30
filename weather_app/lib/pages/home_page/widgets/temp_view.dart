import 'package:flutter/material.dart';
import 'package:weather_app/models/wheather_model/wheather_model.dart';

class TempView extends StatelessWidget {
  const TempView({super.key, required this.snapshot});
  final AsyncSnapshot<Forecast> snapshot;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.network(
          "http://openweathermap.org/img/wn/${snapshot.data!.list![0].weather![0].icon}@4x.png",
          scale: 1.2,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '${snapshot.data!.list![0].temp!.day!.toStringAsFixed(0)} °C',
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              snapshot.data!.list![0].weather![0].description!,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
