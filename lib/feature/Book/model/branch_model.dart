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

class Branches {
  Branches({
    required this.branchid,
    required this.branchName,
    required this.branchPic,
    required this.branchLocation,
    required this.branchDescription,
    required this.branchActive,
    required this.branchPhone,
    required this.branchEmail,
    required this.branchWhatsapp,
    required this.branchMapsX,
    required this.branchMapsY,
    required this.branchMapsUrl,
    required this.branchPriority,
    required this.branchManagerName,
    required this.branchManagerPhone,
    required this.branchManagerEmail,
    required this.branchTradingId,
    required this.branchTaxesId,
  });

  final String? branchid;
  final String? branchName;
  final String? branchPic;
  final String? branchLocation;
  final String? branchDescription;
  final String? branchActive;
  final String? branchPhone;
  final String? branchEmail;
  final String? branchWhatsapp;
  final String? branchMapsX;
  final String? branchMapsY;
  final String? branchMapsUrl;
  final String? branchPriority;
  final String? branchManagerName;
  final String? branchManagerPhone;
  final String? branchManagerEmail;
  final String? branchTradingId;
  final String? branchTaxesId;

  factory Branches.fromJson(Map<String, dynamic> json){
    return Branches(
      branchid: json["BRANCHID"],
      branchName: json["branch_name"],
      branchPic: json["branch_pic"],
      branchLocation: json["branch_location"],
      branchDescription: json["branch_description"],
      branchActive: json["branch_active"],
      branchPhone: json["branch_phone"],
      branchEmail: json["branch_email"],
      branchWhatsapp: json["branch_whatsapp"],
      branchMapsX: json["branch_maps_x"],
      branchMapsY: json["branch_maps_y"],
      branchMapsUrl: json["branch_maps_url"],
      branchPriority: json["branch_priority"],
      branchManagerName: json["branch_manager_name"],
      branchManagerPhone: json["branch_manager_phone"],
      branchManagerEmail: json["branch_manager_email"],
      branchTradingId: json["branch_trading_id"],
      branchTaxesId: json["branch_taxes_id"],
    );
  }

}
