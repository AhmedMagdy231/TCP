class CategoryModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  CategoryModel.formJson(Map<String,dynamic> json){
    hasError = json['hasError'];
    errors = json['errors'];
    messages = json['messages'];
    if(json['data'] is Map)
    {
      data = Data.fromJson(json['data']);
    }
    else
    {
      data = null;
    }

  }

}


class Data {
  List<Specialties>? specialties;

  Data({this.specialties});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['specialties'] != null) {
      specialties = <Specialties>[];
      json['specialties'].forEach((v) {
        specialties!.add(new Specialties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.specialties != null) {
      data['specialties'] = this.specialties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specialties {
  String? sPECIALTYID;
  String? pARENTSPECID;
  String? specialtyTitle;
  String? specialtyDescription;
  String? specialtyPic;
  String? specialtyActive;
  String? specialtyPriority;
  String? specialtyPartners;

  Specialties(
      {this.sPECIALTYID,
        this.pARENTSPECID,
        this.specialtyTitle,
        this.specialtyDescription,
        this.specialtyPic,
        this.specialtyActive,
        this.specialtyPriority,
        this.specialtyPartners});

  Specialties.fromJson(Map<String, dynamic> json) {
    sPECIALTYID = json['SPECIALTYID'];
    pARENTSPECID = json['PARENTSPECID'];
    specialtyTitle = json['specialty_title'];
    specialtyDescription = json['specialty_description'];
    specialtyPic = json['specialty_pic'];
    specialtyActive = json['specialty_active'];
    specialtyPriority = json['specialty_priority'];
    specialtyPartners = json['specialty_partners'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SPECIALTYID'] = this.sPECIALTYID;
    data['PARENTSPECID'] = this.pARENTSPECID;
    data['specialty_title'] = this.specialtyTitle;
    data['specialty_description'] = this.specialtyDescription;
    data['specialty_pic'] = this.specialtyPic;
    data['specialty_active'] = this.specialtyActive;
    data['specialty_priority'] = this.specialtyPriority;
    data['specialty_partners'] = this.specialtyPartners;
    return data;
  }
}
