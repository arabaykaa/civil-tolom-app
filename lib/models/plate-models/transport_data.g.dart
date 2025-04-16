// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransportData _$TransportDataFromJson(Map<String, dynamic> json) =>
    TransportData(
      govPlate: json['govPlate'] as String,
      carTypeName: json['carTypeName'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      color: json['color'] as String,
      engineVolume: json['engineVolume'] as String,
      steering: json['steering'] as String,
      year: json['year'] as String,
      dateFrom: json['dateFrom'] as String?,
    );

Map<String, dynamic> _$TransportDataToJson(TransportData instance) =>
    <String, dynamic>{
      'govPlate': instance.govPlate,
      'carTypeName': instance.carTypeName,
      'brand': instance.brand,
      'model': instance.model,
      'color': instance.color,
      'engineVolume': instance.engineVolume,
      'steering': instance.steering,
      'year': instance.year,
      'dateFrom': instance.dateFrom,
    };
