import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/wheather_model/wheather_model.dart';
import 'package:weather_app/pages/home_page/widgets/week_forecast_card.dart';

class WeekForecast extends StatelessWidget {
  const WeekForecast({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot<Forecast> snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) => WeekForecastCard(
          day: DateFormat('EEE, MMM d, y')
              .format(
                DateTime.fromMillisecondsSinceEpoch(
                    snapshot.data!.list![index].dt! * 1000),
              )
              .split(',')[0],
          image: Image.network(
            "http://openweathermap.org/img/wn/${snapshot.data!.list![index].weather![0].icon}@4x.png",
            scale: 3.6,
            color: Colors.white,
          ),
          temp: snapshot.data!.list![index].temp!.day!.round(),
        ),
      ),
    );
  }
}
