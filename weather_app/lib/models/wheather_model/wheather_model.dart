class Forecast {
  City? city;
  String? cod;
  double? message;
  int? cnt;
  List<WheatherList>? list;

  Forecast({this.city, this.cod, this.message, this.cnt, this.list});

  Forecast.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    cod = json['cod'];
    message = (json['message']as num?)?.toDouble();
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <WheatherList>[];
      json['list'].forEach((v) {
        list!.add(WheatherList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (city != null) {
      data['city'] = city!.toJson();
    }
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;

  City(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    return data;
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = (json['lon']as num?)?.toDouble();
    lat = (json['lat']as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}

class WheatherList {
  int? dt;
  int? sunrise;
  int? sunset;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  List<Weather>? weather;
  double? speed;
  int? deg;
  double? gust;
  int? clouds;
  num? pop;
  double? rain;

  WheatherList(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.weather,
      this.speed,
      this.deg,
      this.gust,
      this.clouds,
      this.pop,
      this.rain});

  WheatherList.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null
        ? FeelsLike.fromJson(json['feels_like'])
        : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    speed = (json['speed']as num?)?.toDouble();
    deg = json['deg'];
    gust = (json['gust']as num?)?.toDouble();
    clouds = json['clouds'];
    pop = json['pop'];
    rain = (json['rain']as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    if (temp != null) {
      data['temp'] = temp!.toJson();
    }
    if (feelsLike != null) {
      data['feels_like'] = feelsLike!.toJson();
    }
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    data['clouds'] = clouds;
    data['pop'] = pop;
    data['rain'] = rain;
    return data;
  }
}

class Temp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = (json['day']as num?)?.toDouble();
    min = (json['min']as num?)?.toDouble();
    max = (json['max']as num?)?.toDouble();
    night = (json['night']as num?)?.toDouble();
    eve = (json['eve']as num?)?.toDouble();
    morn = (json['morn']as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['min'] = min;
    data['max'] = max;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}

class FeelsLike {
  double? day;
  double? night;
  double? eve;
  double? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = (json['day']as num?)?.toDouble();
    night = (json['night']as num?)?.toDouble();
    eve = (json['eve']as num?)?.toDouble();
    morn = (json['morn']as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}
