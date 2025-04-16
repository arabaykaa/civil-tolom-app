class MSSWithDataGeneric<T> {
  final T? data;
  final String message;
  final String service;
  final bool success;

  MSSWithDataGeneric({
    required this.data,
    required this.message,
    required this.service,
    required this.success,
  });

  factory MSSWithDataGeneric.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    final dynamic dynamicData = json['data'];
    T? parsedData;

    if (dynamicData == null) {
      parsedData = null;
    } else if (dynamicData is List) {
      parsedData = fromJsonT(dynamicData);
    } else if (dynamicData is Map<String, dynamic>) {
      parsedData = fromJsonT(parsedData);
    } else {
      throw Exception(
          "Unsuported data type, need extencion! ${dynamicData.runtimeType}");
    }

    return MSSWithDataGeneric(
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message: json['message'],
      service: json['service'],
      success: json['success'],
    );
  }
}
