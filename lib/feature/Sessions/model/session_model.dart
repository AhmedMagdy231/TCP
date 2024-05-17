
class SessionModel {
  SessionModel({
    required this.hasError,
    required this.errors,
    required this.messages,
    required this.data,
  });

  final bool? hasError;
  final List<dynamic> errors;
  final List<dynamic> messages;
  final Data? data;

  factory SessionModel.fromJson(Map<String, dynamic> json){
    return SessionModel(
      hasError: json["hasError"],
      errors: json["errors"] == null ? [] : List<dynamic>.from(json["errors"]!.map((x) => x)),
      messages: json["messages"] == null ? [] : List<dynamic>.from(json["messages"]!.map((x) => x)),
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.resultsTotal,
    required this.pageCurrent,
    required this.pagePrev,
    required this.pageNext,
    required this.pageMax,
    required this.sessions,
  });

  final String? resultsTotal;
  final int? pageCurrent;
  final dynamic pagePrev;
  final dynamic pageNext;
  final int? pageMax;
  final List<Map<String, String>> sessions;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      resultsTotal: json["resultsTotal"],
      pageCurrent: json["pageCurrent"],
      pagePrev: json["pagePrev"],
      pageNext: json["pageNext"],
      pageMax: json["pageMax"],
      sessions: json["sessions"] == null ? [] : List<Map<String, String>>.from(json["sessions"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
    );
  }

}
