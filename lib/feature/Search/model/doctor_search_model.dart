import '../../Category/model/category_details_model.dart';

class SearchDoctorModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  SearchDoctorModel.formJson(Map<String, dynamic> json){
    hasError = json['hasError'];
    errors = json['errors'];
    messages = json['messages'];
    if (json['data'] is Map) {
      data = Data.fromJson(json['data']);

    }
    else {
      data = null;
    }
  }
}




class Data {
  String? searchQuery;
  List<Partners>? partners;

  Data({this.searchQuery, this.partners});

  Data.fromJson(Map<String, dynamic> json) {
    searchQuery = json['search_query'];
    if (json['partners'] != null) {
      partners = <Partners>[];
      json['partners'].forEach((v) {
        partners!.add(new Partners.fromJson(v));
      });
    }
  }


}


