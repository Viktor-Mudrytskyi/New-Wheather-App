import 'package:flutter/material.dart';

class WeekForecastCard extends StatelessWidget {
  const WeekForecastCard({
    super.key,
    required this.day,
    required this.image,
    required this.temp,
  });
  final Image image;
  final String day;
  final int temp;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        shadowColor: Colors.black,
        elevation: 5.0,
        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              day,
              style: const TextStyle(fontSize: 25.0, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 7),
                Text(
                  '$temp°C',
                  style: const TextStyle(fontSize: 30.0, color: Colors.white),
                ),
                image,
              ],
            )
          ],
        ),
      ),
    );
  }
}
