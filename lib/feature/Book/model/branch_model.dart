import '../../Doctor/model/doctor_details_model.dart';

class BranchModel {
  BranchModel({
    required this.hasError,
    required this.errors,
    required this.messages,
    required this.data,
  });

  final bool? hasError;
  final List<String> errors;
  final List<String> messages;
  final Data? data;

  factory BranchModel.fromJson(Map<String, dynamic> json){
    return BranchModel(
      hasError: json["hasError"],
      errors: json["errors"] == null ? [] : List<String>.from(json["errors"]!.map((x) => x)),
      messages: json["messages"] == null ? [] : List<String>.from(json["messages"]!.map((x) => x)),
      data: json["data"] is List ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.branches,
  });

  final List<Branches> branches;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      branches: json["branches"] == null ? [] : List<Branches>.from(json["branches"]!.map((x) => Branches.fromJson(x))),
    );
  }

}


