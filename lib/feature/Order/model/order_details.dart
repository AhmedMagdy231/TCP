class OrderDetailsModel {
  OrderDetailsModel({
    required this.hasError,
    required this.errors,
    required this.messages,
    required this.data,
  });

  final bool? hasError;
  final List<dynamic> errors;
  final List<dynamic> messages;
  final Data? data;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json){
    return OrderDetailsModel(
      hasError: json["hasError"],
      errors: json["errors"] == null ? [] : List<dynamic>.from(json["errors"]!.map((x) => x)),
      messages: json["messages"] == null ? [] : List<dynamic>.from(json["messages"]!.map((x) => x)),
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.invoice,
    required this.sessions,
  });

  final Map<String, String> invoice;
  final List<dynamic> sessions;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      invoice: Map.from(json["invoice"]).map((k, v) => MapEntry<String, String>(k, v)),
      sessions: json["sessions"] == null ? [] : List<dynamic>.from(json["sessions"]!.map((x) => x)),
    );
  }

}
