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
  final int? pagePrev;
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
    required this.partnerFullname,
    required this.partnerName,
    required this.partnerPosition,
    required this.partnerDescription,
    required this.partnerPhone,
    required this.partnerStatus,
    required this.partnerDoctor,
    required this.partnerInvestor,
    required this.partnerFeatured,
    required this.partnerPriority,
    required this.partnerEmail,
    required this.partnerWebsite,
    required this.partnerCountry,
    required this.partnerContactPhone,
    required this.partnerContactEmail,
    required this.partnerContactWhatsapp,
    required this.partnerPic,
    required this.partnerCvfilename,
    required this.partnerMylang,
    required this.partnerUsername,
    required this.partnerPassword,
    required this.partnerLoginTime,
    required this.partnerLip,
    required this.partnerRememberMeKey,
    required this.partnerRememberMeTime,
    required this.partnerReviewsTotal,
    required this.partnerReviewsAvg,
    required this.partnerWhatsappNumber,
    required this.partnerWhatsappEnabled,
    required this.partnerTimezone,
    required this.partnerDebitInitial,
    required this.partnerCreditInitial,
    required this.partnerBalanceInitial,
    required this.partnerPurchases,
    required this.partnerPurchasesTotal,
    required this.partnerPurchasesPaid,
    required this.partnerPurchasesWithdrawed,
    required this.partnerDebit,
    required this.partnerCredit,
    required this.partnerBalance,
    required this.partnerTokens,
    required this.partnerAccesstoken,
    required this.partnerFirebaseAccesstoken,
    required this.parentspecid,
    required this.specialtyTitle,
    required this.specialtyDescription,
    required this.specialtyPic,
    required this.specialtyIcon,
    required this.specialtyActive,
    required this.specialtyPriority,
    required this.specialtyPartners,
    required this.partnerBookmarked,
  });

  final String? partnerid;
  final String? specialtyid;
  final String? partnerFullname;
  final String? partnerName;
  final String? partnerPosition;
  final String? partnerDescription;
  final String? partnerPhone;
  final String? partnerStatus;
  final String? partnerDoctor;
  final String? partnerInvestor;
  final String? partnerFeatured;
  final String? partnerPriority;
  final String? partnerEmail;
  final String? partnerWebsite;
  final String? partnerCountry;
  final String? partnerContactPhone;
  final String? partnerContactEmail;
  final String? partnerContactWhatsapp;
  final String? partnerPic;
  final String? partnerCvfilename;
  final String? partnerMylang;
  final String? partnerUsername;
  final String? partnerPassword;
  final String? partnerLoginTime;
  final String? partnerLip;
  final String? partnerRememberMeKey;
  final String? partnerRememberMeTime;
  final String? partnerReviewsTotal;
  final String? partnerReviewsAvg;
  final String? partnerWhatsappNumber;
  final String? partnerWhatsappEnabled;
  final String? partnerTimezone;
  final String? partnerDebitInitial;
  final String? partnerCreditInitial;
  final String? partnerBalanceInitial;
  final String? partnerPurchases;
  final String? partnerPurchasesTotal;
  final String? partnerPurchasesPaid;
  final String? partnerPurchasesWithdrawed;
  final String? partnerDebit;
  final String? partnerCredit;
  final String? partnerBalance;
  final String? partnerTokens;
  final String? partnerAccesstoken;
  final String? partnerFirebaseAccesstoken;
  final String? parentspecid;
  final String? specialtyTitle;
  final String? specialtyDescription;
  final String? specialtyPic;
  final String? specialtyIcon;
  final String? specialtyActive;
  final String? specialtyPriority;
  final String? specialtyPartners;
  final int? partnerBookmarked;

  factory Partners.fromJson(Map<String, dynamic> json){
    return Partners(
      partnerid: json["PARTNERID"],
      specialtyid: json["SPECIALTYID"],
      partnerFullname: json["partner_fullname"],
      partnerName: json["partner_name"],
      partnerPosition: json["partner_position"],
      partnerDescription: json["partner_description"],
      partnerPhone: json["partner_phone"],
      partnerStatus: json["partner_status"],
      partnerDoctor: json["partner_doctor"],
      partnerInvestor: json["partner_investor"],
      partnerFeatured: json["partner_featured"],
      partnerPriority: json["partner_priority"],
      partnerEmail: json["partner_email"],
      partnerWebsite: json["partner_website"],
      partnerCountry: json["partner_country"],
      partnerContactPhone: json["partner_contact_phone"],
      partnerContactEmail: json["partner_contact_email"],
      partnerContactWhatsapp: json["partner_contact_whatsapp"],
      partnerPic: json["partner_pic"],
      partnerCvfilename: json["partner_cvfilename"],
      partnerMylang: json["partner_mylang"],
      partnerUsername: json["partner_username"],
      partnerPassword: json["partner_password"],
      partnerLoginTime: json["partner_login_time"],
      partnerLip: json["partner_lip"],
      partnerRememberMeKey: json["partner_remember_me_key"],
      partnerRememberMeTime: json["partner_remember_me_time"],
      partnerReviewsTotal: json["partner_reviews_total"],
      partnerReviewsAvg: json["partner_reviews_avg"],
      partnerWhatsappNumber: json["partner_whatsapp_number"],
      partnerWhatsappEnabled: json["partner_whatsapp_enabled"],
      partnerTimezone: json["partner_timezone"],
      partnerDebitInitial: json["partner_debit_initial"],
      partnerCreditInitial: json["partner_credit_initial"],
      partnerBalanceInitial: json["partner_balance_initial"],
      partnerPurchases: json["partner_purchases"],
      partnerPurchasesTotal: json["partner_purchases_total"],
      partnerPurchasesPaid: json["partner_purchases_paid"],
      partnerPurchasesWithdrawed: json["partner_purchases_withdrawed"],
      partnerDebit: json["partner_debit"],
      partnerCredit: json["partner_credit"],
      partnerBalance: json["partner_balance"],
      partnerTokens: json["partner_tokens"],
      partnerAccesstoken: json["partner_accesstoken"],
      partnerFirebaseAccesstoken: json["partner_firebase_accesstoken"],
      parentspecid: json["PARENTSPECID"],
      specialtyTitle: json["specialty_title"],
      specialtyDescription: json["specialty_description"],
      specialtyPic: json["specialty_pic"],
      specialtyIcon: json["specialty_icon"],
      specialtyActive: json["specialty_active"],
      specialtyPriority: json["specialty_priority"],
      specialtyPartners: json["specialty_partners"],
      partnerBookmarked: json["partner_bookmarked"],
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
