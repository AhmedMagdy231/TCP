class CategoryDetailsModel {
  CategoryDetailsModel({
    required this.hasError,
    required this.errors,
    required this.messages,
    required this.data,
  });

  final bool hasError;
  final List<dynamic> errors;
  final List<dynamic> messages;
  final Data? data;

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json){
    return CategoryDetailsModel(
      hasError: json["hasError"],
      errors: json["errors"] == null ? [] : List<dynamic>.from(json["errors"]!.map((x) => x)),
      messages: json["messages"] == null ? [] : List<dynamic>.from(json["messages"]!.map((x) => x)),
      data: json["data"] is List  ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.specialty,
    required this.subSpecialties,
    required this.resultsTotal,
    required this.pageCurrent,
    required this.pagePrev,
    required this.pageNext,
    required this.pageMax,
    required this.partners,
  });

  final Specialty? specialty;
  final List<dynamic> subSpecialties;
  final String? resultsTotal;
  final int? pageCurrent;
  final dynamic pagePrev;
  final int? pageNext;
  final int? pageMax;
  final List<Partners> partners;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      specialty: json["specialty"] == null ? null : Specialty.fromJson(json["specialty"]),
      subSpecialties: json["sub_specialties"] == null ? [] : List<dynamic>.from(json["sub_specialties"]!.map((x) => x)),
      resultsTotal: json["resultsTotal"],
      pageCurrent: json["pageCurrent"],
      pagePrev: json["pagePrev"],
      pageNext: json["pageNext"],
      pageMax: json["pageMax"],
      partners: json["partners"] == null ? [] : List<Partners>.from(json["partners"]!.map((x) => Partners.fromJson(x))),
    );
  }

}

class Partners {
  Partners({
    required this.partnerid,
    required this.specialtyid,
    required this.partnerName,
    required this.partnerPosition,
    required this.partnerSessionPrice,
    required this.partnerSessionDiscount,
    required this.partnerContactPhone,
    required this.partnerContactEmail,
    required this.partnerContactWhatsapp,
    required this.partnerPic,
    required this.partnerReviewsTotal,
    required this.partnerReviewsAvg,
    required this.specialtyTitle,
  });

  final String? partnerid;
  final String? specialtyid;
  final String? partnerName;
  final String? partnerPosition;
  final String? partnerSessionPrice;
  final String? partnerSessionDiscount;
  final String? partnerContactPhone;
  final String? partnerContactEmail;
  final String? partnerContactWhatsapp;
  final String? partnerPic;
  final String? partnerReviewsTotal;
  final String? partnerReviewsAvg;
  final String? specialtyTitle;

  factory Partners.fromJson(Map<String, dynamic> json){
    return Partners(
      partnerid: json["PARTNERID"],
      specialtyid: json["SPECIALTYID"],
      partnerName: json["partner_name"],
      partnerPosition: json["partner_position"],
      partnerSessionPrice: json["partner_session_price"],
      partnerSessionDiscount: json["partner_session_discount"],
      partnerContactPhone: json["partner_contact_phone"],
      partnerContactEmail: json["partner_contact_email"],
      partnerContactWhatsapp: json["partner_contact_whatsapp"],
      partnerPic: json["partner_pic"],
      partnerReviewsTotal: json["partner_reviews_total"],
      partnerReviewsAvg: json["partner_reviews_avg"],
      specialtyTitle: json["specialty_title"],
    );
  }

}

class Specialty {
  Specialty({
    required this.specialtyid,
    required this.parentspecid,
    required this.specialtyTitle,
    required this.specialtyDescription,
    required this.specialtyPic,
    required this.specialtyIcon,
    required this.specialtyActive,
    required this.specialtyPriority,
    required this.specialtyPartners,
  });

  final String? specialtyid;
  final String? parentspecid;
  final String? specialtyTitle;
  final String? specialtyDescription;
  final String? specialtyPic;
  final String? specialtyIcon;
  final String? specialtyActive;
  final String? specialtyPriority;
  final String? specialtyPartners;

  factory Specialty.fromJson(Map<String, dynamic> json){
    return Specialty(
      specialtyid: json["SPECIALTYID"],
      parentspecid: json["PARENTSPECID"],
      specialtyTitle: json["specialty_title"],
      specialtyDescription: json["specialty_description"],
      specialtyPic: json["specialty_pic"],
      specialtyIcon: json["specialty_icon"],
      specialtyActive: json["specialty_active"],
      specialtyPriority: json["specialty_priority"],
      specialtyPartners: json["specialty_partners"],
    );
  }

}

