class CheckModel {
  CheckModel({
    required this.hasError,
    required this.errors,
    required this.messages,
  });

  final bool? hasError;
  final List<String> errors;
  final List<String> messages;

  factory CheckModel.fromJson(Map<String, dynamic> json){
    return CheckModel(
      hasError: json["hasError"],
      errors: json["errors"] == null ? [] : List<String>.from(json["errors"]!.map((x) => x)),
      messages: json["messages"] == null ? [] : List<String>.from(json["messages"]!.map((x) => x)),
    );
  }

}
