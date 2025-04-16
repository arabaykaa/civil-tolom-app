import 'package:json_annotation/json_annotation.dart';

part 'transport_data.g.dart';

@JsonSerializable()
class TransportData {
  final String govPlate;
  final String carTypeName;
  final String brand;
  final String model;
  final String color;
  final String engineVolume;
  final String steering;
  final String year;
  final String? dateFrom;

  TransportData({
    required this.govPlate,
    required this.carTypeName,
    required this.brand,
    required this.model,
    required this.color,
    required this.engineVolume,
    required this.steering,
    required this.year,
    this.dateFrom,
  });

  factory TransportData.fromJson(Map<String, dynamic> json) =>
      _$TransportDataFromJson(json);

  Map<String, dynamic> toJson() => _$TransportDataToJson(this);
}
