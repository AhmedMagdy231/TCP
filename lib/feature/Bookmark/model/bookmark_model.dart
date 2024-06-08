import '../../Category/model/category_details_model.dart';

class BookmarkModel {
  BookmarkModel({
    required this.hasError,
    required this.errors,
    required this.messages,
    required this.data,
  });

  final bool? hasError;
  final List<String> errors;
  final List<String> messages;
  final Data? data;

  factory BookmarkModel.fromJson(Map<String, dynamic> json){
    return BookmarkModel(
      hasError: json["hasError"],
      errors: json["errors"] == null ? [] : List<String>.from(json["errors"]!.map((x) => x)),
      messages: json["messages"] == null ? [] : List<String>.from(json["messages"]!.map((x) => x)),
      data: json["data"] is List ? null : Data.fromJson(json["data"]),
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
    required this.partnersBookmarks,
  });

  final String? resultsTotal;
  final int? pageCurrent;
  final dynamic pagePrev;
  final dynamic pageNext;
  final int? pageMax;
  final List<Partners> partnersBookmarks;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      resultsTotal: json["resultsTotal"],
      pageCurrent: json["pageCurrent"],
      pagePrev: json["pagePrev"],
      pageNext: json["pageNext"],
      pageMax: json["pageMax"],
      partnersBookmarks: json["partners_bookmarks"] == null ? [] : List<Partners>.from(json["partners_bookmarks"]!.map((x) => Partners.fromJson(x))),
    );
  }

}


