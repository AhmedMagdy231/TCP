class TimeModel{
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  TimeModel.formJson(Map<String,dynamic> json){
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
  List<Slots>? slots;



  Data.fromJson(Map<String, dynamic> json) {
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add( Slots.fromJson(v));
      });
    }
  }


}

class Slots {
  String? id;
  String? text;



  Slots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
  }

}
