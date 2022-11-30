import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/api/wheather_api.dart';
import 'package:weather_app/models/wheather_model/wheather_model.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Forecast>? forecast;
  String _cityName = 'London';

  @override
  void initState() {
    log('instance');
    forecast = WheatherApi.fetchForecastLonLat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('openwheathermap.org'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecast=null;
              forecast = WheatherApi.fetchForecastLonLat();
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () async{
              final name=await Navigator.of(context).pushNamed('/city_page');
              _cityName=name as String;
              setState(() {
                forecast=WheatherApi.fetchForecast(_cityName);
              });
              log(_cityName);
            },
            icon: const Icon(Icons.location_city),
          ),
        ],
      ),
      body: FutureBuilder(
        future: forecast,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                const SizedBox(height: 50),
                CityView(
                  city: snapshot.data!.city!.name!,
                  country: snapshot.data!.city!.country!,
                ),
                const SizedBox(height: 25),
                TempView(
                  snapshot: snapshot,
                ),
                const Divider(thickness: 2),
                const SizedBox(height: 25),
                AdditionalInfo(snapshot: snapshot),
                const SizedBox(height: 25),
                const Divider(thickness: 2),
                const SizedBox(height: 25),
                WeekForecast(snapshot: snapshot,),
              ],
            );
          } else {
            return const Center(
              child: SpinKitCircle(
                color: Colors.black,
                size: 80,
              ),
            );
          }
        },
      ),
    );
  }
}
