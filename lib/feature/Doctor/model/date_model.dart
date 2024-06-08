import 'package:intl/intl.dart';

class DateModel{
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  DateModel.formJson(Map<String,dynamic> json){
    hasError = json['hasError'];
    errors = json['errors'];
    messages = json['messages'];
    if(json['data'] is Map)
    {
      data = Data.fromJson(json['data']);
    }


  }

}



class Data {
  List<Dates>? dates;

  Data({this.dates});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add( Dates.fromJson(v));
      });
    }
  }


}

class Dates {
  String? id;
  String? text;
  String? monthName;
  String?  dayNumber;



  Dates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];

    DateTime date = DateTime.parse(text!);


    var format = DateFormat('EEE', Intl.getCurrentLocale());
    monthName = format.format(date);
    dayNumber = DateFormat('dd', Intl.getCurrentLocale()).format(date);



  }


}
