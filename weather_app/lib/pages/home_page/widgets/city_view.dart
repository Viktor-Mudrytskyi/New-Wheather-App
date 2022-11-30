import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CityView extends StatelessWidget {
  const CityView({
    super.key,
    required this.city,
    required this.country,
  });

  final String city;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$city, $country',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
        ),
        Text(
          _currentTime(),
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  String _currentTime(){
    return DateFormat('EEE, MMM d, y').format(DateTime.now());
  }
}
