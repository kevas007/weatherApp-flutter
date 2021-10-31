import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riche/model/weather_model.dart';
import 'package:riche/services/weather_api_client.dart';
import 'package:riche/views/additional_information.dart';
import 'package:riche/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home:HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  Future<void> getData() async{
  data = await client.getCurrentWeather("Brussels");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(backgroundColor:Color(0xFFf9f9f9),
          elevation: 0,
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon:Icon(Icons.menu),
        color:  Colors.black,
        ),
        ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              currentWeather(Icons.wb_sunny_rounded, "${data!.temp}°C", "min: ${data!.temp_min}°C", "max: ${data!.temp_max}°C", "${data!.cityName}"),
              SizedBox(
                height: 80.0,
              ),
              Text(
                "Additional Information",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color(0xdd212121),
                ),
              ),
              Divider(),
              SizedBox(
                height: 80.0,
              ),
              addtionalInformation("${data!.wind}", "${data!.humidity}", "${data!.pressure}", "${data!.feels_like}",)

            ],

          );

          } else if( snapshot.connectionState== ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );

          }
        return Container();
        },
      ),
      );
  }
}
