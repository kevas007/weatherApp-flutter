class Weather{
  String? cityName;
  double? temp;
  double? temp_min;
  double? temp_max;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;
   Weather({
    this.cityName,
     this.temp,
     this.temp_min,
     this.temp_max,
     this.wind,
     this.humidity,
     this.feels_like,
     this.pressure
});


   Weather.fromJson(
       Map<String, dynamic> json
       ){
     cityName = json['name'];
     temp = json['main']["temp"];
     temp_min = json['main']['temp_min'];
     temp_max = json['main']['temp_max'];
     wind = json['wind']["speed"];
     pressure = json["main"]["pressure"];
     humidity = json["main"]["humidity"];
     feels_like= json["main"]["feels_like"];
   }
}