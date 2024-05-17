class CategoryDetailsModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  CategoryDetailsModel.formJson(Map<String, dynamic> json){
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
  Specialty? specialty;
  List<Null>? subSpecialties;
  List<Partners>? partners;

  Data({this.specialty, this.subSpecialties, this.partners});

  Data.fromJson(Map<String, dynamic> json) {
    specialty = json['specialty'] != null
        ? new Specialty.fromJson(json['specialty'])
        : null;
    // if (json['sub_specialties'] != null) {
    //   subSpecialties = <Null>[];
    //   json['sub_specialties'].forEach((v) {
    //     subSpecialties!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['partners'] != null) {
      partners = <Partners>[];
      json['partners'].forEach((v) {
        partners!.add(new Partners.fromJson(v));
      });
    }
  }


}

class Specialty {
  String? sPECIALTYID;
  String? pARENTSPECID;
  String? specialtyTitle;
  String? specialtyDescription;
  String? specialtyPic;
  String? specialtyActive;
  String? specialtyPriority;
  String? specialtyPartners;



  Specialty.fromJson(Map<String, dynamic> json) {
    sPECIALTYID = json['SPECIALTYID'];
    pARENTSPECID = json['PARENTSPECID'];
    specialtyTitle = json['specialty_title'];
    specialtyDescription = json['specialty_description'];
    specialtyPic = json['specialty_pic'];
    specialtyActive = json['specialty_active'];
    specialtyPriority = json['specialty_priority'];
    specialtyPartners = json['specialty_partners'];
  }


}

class Partners {
  String? pARTNERID;
  String? sPECIALTYID;
  String? partnerFullname;
  String? partnerName;
  String? partnerPosition;
  String? partnerDescription;
  String? partnerPhone;
  String? partnerStatus;
  String? partnerDoctor;
  String? partnerInvestor;
  String? partnerFeatured;
  String? partnerPriority;
  String? partnerEmail;
  String? partnerWebsite;
  String? partnerCountry;
  String? partnerPic;
  String? partnerCvfilename;
  String? partnerMylang;
  String? partnerUsername;
  String? partnerPassword;
  String? partnerLoginTime;
  String? partnerLip;
  String? partnerRememberMeKey;
  String? partnerRememberMeTime;
  String? partnerReviewsTotal;
  String? partnerReviewsAvg;
  String? partnerWhatsappNumber;
  String? partnerWhatsappEnabled;
  String? partnerTimezone;
  String? partnerDebitInitial;
  String? partnerCreditInitial;
  String? partnerBalanceInitial;
  String? partnerPurchases;
  String? partnerPurchasesTotal;
  String? partnerPurchasesPaid;
  String? partnerDebit;
  String? partnerCredit;
  String? partnerBalance;
  String? partnerTokens;
  String? partnerAccesstoken;
  String? partnerFirebaseAccesstoken;
  int? partnerBookmarked;



  Partners.fromJson(Map<String, dynamic> json) {
    pARTNERID = json['PARTNERID'];
    sPECIALTYID = json['SPECIALTYID'];
    partnerFullname = json['partner_fullname'];
    partnerName = json['partner_name'];
    partnerPosition = json['partner_position'];
    partnerDescription = json['partner_description'];
    partnerPhone = json['partner_phone'];
    partnerStatus = json['partner_status'];
    partnerDoctor = json['partner_doctor'];
    partnerInvestor = json['partner_investor'];
    partnerFeatured = json['partner_featured'];
    partnerPriority = json['partner_priority'];
    partnerEmail = json['partner_email'];
    partnerWebsite = json['partner_website'];
    partnerCountry = json['partner_country'];
    partnerPic = json['partner_pic'];
    partnerCvfilename = json['partner_cvfilename'];
    partnerMylang = json['partner_mylang'];
    partnerUsername = json['partner_username'];
    partnerPassword = json['partner_password'];
    partnerLoginTime = json['partner_login_time'];
    partnerLip = json['partner_lip'];
    partnerRememberMeKey = json['partner_remember_me_key'];
    partnerRememberMeTime = json['partner_remember_me_time'];
    partnerReviewsTotal = json['partner_reviews_total'];
    partnerReviewsAvg = json['partner_reviews_avg'];
    partnerWhatsappNumber = json['partner_whatsapp_number'];
    partnerWhatsappEnabled = json['partner_whatsapp_enabled'];
    partnerTimezone = json['partner_timezone'];
    partnerDebitInitial = json['partner_debit_initial'];
    partnerCreditInitial = json['partner_credit_initial'];
    partnerBalanceInitial = json['partner_balance_initial'];
    partnerPurchases = json['partner_purchases'];
    partnerPurchasesTotal = json['partner_purchases_total'];
    partnerPurchasesPaid = json['partner_purchases_paid'];
    partnerDebit = json['partner_debit'];
    partnerCredit = json['partner_credit'];
    partnerBalance = json['partner_balance'];
    partnerTokens = json['partner_tokens'];
    partnerAccesstoken = json['partner_accesstoken'];
    partnerFirebaseAccesstoken = json['partner_firebase_accesstoken'];
    partnerBookmarked = json['partner_bookmarked'];
  }


}
