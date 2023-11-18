class ForecastModel{
  final String date;
  final String icon;
  final double max_temp;
  final double min_temp;

  ForecastModel({required this.date, required this.icon, required this.min_temp, required this.max_temp});

  factory ForecastModel.fromData(data){
    return ForecastModel(date: data['date'],
        icon: data['day']['condition']['icon'],
        min_temp: data['day']['mintemp_c'],
        max_temp: data['day']['maxtemp_c']);
  }
}