import 'package:tolom/models/mss_with_data_generic.dart';

class ArestInfo {
  final MSSWithDataGeneric<Datas> response;

  ArestInfo(this.response);

  factory ArestInfo.fromJson(Map<String, dynamic> json) {
    final response = MSSWithDataGeneric<Datas>.fromJson(
      json,
      (dataJson) => Datas.fromJson(dataJson),
    );
    return ArestInfo(response);
  }
}

class Datas {
  final String name;

  Datas({required this.name});

  factory Datas.fromJson(Map<String, dynamic> json) {
    return Datas(name: json['name']);
  }
}
