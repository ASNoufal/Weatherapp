import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather_app/searchscreen.dart';

import 'package:weather_app/Services/weatherModel.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWheather});
  final locationWheather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

dynamic condition;
int? temperature;
String? name;
WeatherModel weatherModel = WeatherModel();
String? weathertemperature;

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWheather);
  }

  void updateUI(weather) {
    setState(() {
      if (weather == null) {
        condition = 'eror';
        name = 'invalid';
        temperature = 0;
        name = '';
        weathertemperature = 'srry unable to find';

        return;
      }
      condition = weather['weather'][0]['id'];
      double temp = weather['main']['temp'];
      temperature = temp.toInt();
      name = weather['name'];
      weathertemperature = weatherModel.getMessage(temperature!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/pexels-pixabay-209831.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () async {
                        var weather = await weatherModel.location();
                        updateUI(weather);
                      },
                      icon: Icon(Icons.navigation),
                    ),
                    IconButton(
                        onPressed: () async {
                          var typedName = await Navigator.push((context),
                              MaterialPageRoute(builder: (context) {
                            return SearchScreen();
                          }));
                          if (typedName != null) {
                            var weather =
                                await weatherModel.cityLocation(typedName);
                            updateUI(weather);
                          }
                        },
                        icon: Icon(Icons.location_city))
                  ],
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Text(
                '$temperature°c',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 150,
              ),
              Text(
                '$weathertemperature in $name',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent),
              ),
            ],
          ),
        )
      ],
    );
  }
}
