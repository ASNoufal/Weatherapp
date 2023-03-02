import 'package:flutter/material.dart';

import 'package:weather_app/Services/weatherModel.dart';

import 'package:weather_app/secondPage.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    currentLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
            child: SpinKitDoubleBounce(
          color: Colors.black,
          size: 100,
        )),
      ),
    );
  }

  currentLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weather = await weatherModel.location();

    Navigator.push((context), MaterialPageRoute(builder: (ctx) {
      return LocationScreen(
        locationWheather: weather,
      );
    }));
  }
}
