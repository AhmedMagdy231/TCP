import '../../Book/model/branch_model.dart';

class DoctorDetailsModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  DoctorDetailsModel.formJson(Map<String, dynamic> json){
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
  Partner? partner;
  List<PartnersPosts>? partnersPosts;
  List<SimilarPartners>? similarPartners;
  List<PartnersReviews>? partnersReviews;
  List<Branches>? branches;



  Data.fromJson(Map<String, dynamic> json) {
    partner =
    json['partner'] != null ? new Partner.fromJson(json['partner']) : null;
    if (json['partners_posts'] != null) {
      partnersPosts = <PartnersPosts>[];
      json['partners_posts'].forEach((v) {
        partnersPosts!.add( PartnersPosts.fromJson(v));
      });
    }
    if (json['similar_partners'] != null) {
      similarPartners = <SimilarPartners>[];
      json['similar_partners'].forEach((v) {
        similarPartners!.add( SimilarPartners.fromJson(v));
      });
    }
    if (json['partners_reviews'] != null) {
      partnersReviews = <PartnersReviews>[];
      json['partners_reviews'].forEach((v) {
        partnersReviews!.add( PartnersReviews.fromJson(v));
      });
    }
    if (json['branches'] != null) {
      branches = <Branches>[];
      json['branches'].forEach((v) {
        branches!.add( Branches.fromJson(v));

      });
    }
  }


}

class Partner {
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



  Partner.fromJson(Map<String, dynamic> json) {
    pARTNERID = json['PARTNERID'];
    sPECIALTYID = json['SPECIALTYID'];
    partnerFullname = json['partner_fullname'];
    partnerName = json['partner_name'];
    partnerPosition = json['partner_position'];
    partnerDescription = json['partner_description'];
    partnerPhone = json['partner_contact_phone'];
    partnerStatus = json['partner_status'];
    partnerDoctor = json['partner_doctor'];
    partnerInvestor = json['partner_investor'];
    partnerFeatured = json['partner_featured'];
    partnerPriority = json['partner_priority'];
    partnerEmail = json['partner_contact_email'];
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
    partnerWhatsappNumber = json['partner_contact_whatsapp'];
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
  }


}

class SimilarPartners {
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

  SimilarPartners(
      {this.pARTNERID,
        this.sPECIALTYID,
        this.partnerFullname,
        this.partnerName,
        this.partnerPosition,
        this.partnerDescription,
        this.partnerPhone,
        this.partnerStatus,
        this.partnerDoctor,
        this.partnerInvestor,
        this.partnerFeatured,
        this.partnerPriority,
        this.partnerEmail,
        this.partnerWebsite,
        this.partnerCountry,
        this.partnerPic,
        this.partnerCvfilename,
        this.partnerMylang,
        this.partnerUsername,
        this.partnerPassword,
        this.partnerLoginTime,
        this.partnerLip,
        this.partnerRememberMeKey,
        this.partnerRememberMeTime,
        this.partnerReviewsTotal,
        this.partnerReviewsAvg,
        this.partnerWhatsappNumber,
        this.partnerWhatsappEnabled,
        this.partnerTimezone,
        this.partnerDebitInitial,
        this.partnerCreditInitial,
        this.partnerBalanceInitial,
        this.partnerPurchases,
        this.partnerPurchasesTotal,
        this.partnerPurchasesPaid,
        this.partnerDebit,
        this.partnerCredit,
        this.partnerBalance,
        this.partnerTokens,
        this.partnerAccesstoken,
        this.partnerFirebaseAccesstoken});

  SimilarPartners.fromJson(Map<String, dynamic> json) {
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
  }


}

class PartnersPosts {
  String? pARPOSTID;
  String? pARTNERID;
  String? parpostTitle;
  String? parpostFilename;
  String? parpostCover;



  PartnersPosts.fromJson(Map<String, dynamic> json) {
    pARPOSTID = json['PARPOSTID'];
    pARTNERID = json['PARTNERID'];
    parpostTitle = json['parpost_title'];
    parpostFilename = json['parpost_filename'];
    parpostCover = json['parpost_cover'];
  }


}

class PartnersReviews {
  String? rEVIEWID;
  String? pATIENTID;
  String? pARTNERID;
  String? reviewStars;
  String? reviewTitle;
  String? reviewTxt;
  String? reviewActive;
  String? reviewDate;
  String? reviewTime;
  String? reviewPublished;
  String? pATIENTAFID;
  String? patientUniqueid;
  String? patientFullname;
  String? patientType;
  String? patientEmail;
  String? patientPhone;
  String? patientTaxesId;
  String? patientTradingId;
  String? patientSales;
  String? patientSalesTotal;
  String? patientSalesPaid;
  String? patientSalesWithdrawed;
  String? patientDebit;
  String? patientCredit;
  String? patientBalance;
  String? patientDebitInitial;
  String? patientCreditInitial;
  String? patientBalanceInitial;
  String? patientUsername;
  String? patientPassword;
  String? patientGender;
  String? patientOrganization;
  String? patientDescription;
  String? patientCountry;
  String? patientOrders;
  String? patientAddTime;
  String? patientLoginTime;
  String? patientVerified;
  String? patientStatus;
  String? patientAssessed;
  String? patientAssessedNotes;
  String? patientForcePassword;
  String? patientProfilepicture;
  String? patientCoverpicture;
  String? patientWebsite;
  dynamic patientRememberMeKey;
  dynamic patientRememberMeTime;
  String? patientIp;
  String? patientLip;
  String? patientMylang;
  String? patientMycountry;
  String? patientFacebookConnected;
  String? patientFacebookId;
  String? patientVcode;
  String? patientVcodeTime;
  String? patientResetVcode;
  String? patientResetVcodeTime;
  String? patientGoogleConnected;
  String? patientGoogleId;
  String? patientCity;
  String? patientStreet;
  String? patientBuilding;
  String? patientPhone2;
  String? patientAddressInfo;
  String? patientCode;
  String? patientPoints;
  String? patientWhatsappEnabled;
  String? patientWhatsappNumber;
  String? patientTimezone;
  String? patientIdcardFilename;
  String? patientAccesstoken;
  String? patientFirebaseAccesstoken;

  PartnersReviews(
      {this.rEVIEWID,
        this.pATIENTID,
        this.pARTNERID,
        this.reviewStars,
        this.reviewTitle,
        this.reviewTxt,
        this.reviewActive,
        this.reviewDate,
        this.reviewTime,
        this.reviewPublished,
        this.pATIENTAFID,
        this.patientUniqueid,
        this.patientFullname,
        this.patientType,
        this.patientEmail,
        this.patientPhone,
        this.patientTaxesId,
        this.patientTradingId,
        this.patientSales,
        this.patientSalesTotal,
        this.patientSalesPaid,
        this.patientSalesWithdrawed,
        this.patientDebit,
        this.patientCredit,
        this.patientBalance,
        this.patientDebitInitial,
        this.patientCreditInitial,
        this.patientBalanceInitial,
        this.patientUsername,
        this.patientPassword,
        this.patientGender,
        this.patientOrganization,
        this.patientDescription,
        this.patientCountry,
        this.patientOrders,
        this.patientAddTime,
        this.patientLoginTime,
        this.patientVerified,
        this.patientStatus,
        this.patientAssessed,
        this.patientAssessedNotes,
        this.patientForcePassword,
        this.patientProfilepicture,
        this.patientCoverpicture,
        this.patientWebsite,
        this.patientRememberMeKey,
        this.patientRememberMeTime,
        this.patientIp,
        this.patientLip,
        this.patientMylang,
        this.patientMycountry,
        this.patientFacebookConnected,
        this.patientFacebookId,
        this.patientVcode,
        this.patientVcodeTime,
        this.patientResetVcode,
        this.patientResetVcodeTime,
        this.patientGoogleConnected,
        this.patientGoogleId,
        this.patientCity,
        this.patientStreet,
        this.patientBuilding,
        this.patientPhone2,
        this.patientAddressInfo,
        this.patientCode,
        this.patientPoints,
        this.patientWhatsappEnabled,
        this.patientWhatsappNumber,
        this.patientTimezone,
        this.patientIdcardFilename,
        this.patientAccesstoken,
        this.patientFirebaseAccesstoken});

  PartnersReviews.fromJson(Map<String, dynamic> json) {
    rEVIEWID = json['REVIEWID'];
    pATIENTID = json['PATIENTID'];
    pARTNERID = json['PARTNERID'];
    reviewStars = json['review_stars'];
    reviewTitle = json['review_title'];
    reviewTxt = json['review_txt'];
    reviewActive = json['review_active'];
    reviewDate = json['review_date'];
    reviewTime = json['review_time'];
    reviewPublished = json['review_published'];
    pATIENTAFID = json['PATIENTAFID'];
    patientUniqueid = json['patient_uniqueid'];
    patientFullname = json['patient_fullname'];
    patientType = json['patient_type'];
    patientEmail = json['patient_email'];
    patientPhone = json['patient_phone'];
    patientTaxesId = json['patient_taxes_id'];
    patientTradingId = json['patient_trading_id'];
    patientSales = json['patient_sales'];
    patientSalesTotal = json['patient_sales_total'];
    patientSalesPaid = json['patient_sales_paid'];
    patientSalesWithdrawed = json['patient_sales_withdrawed'];
    patientDebit = json['patient_debit'];
    patientCredit = json['patient_credit'];
    patientBalance = json['patient_balance'];
    patientDebitInitial = json['patient_debit_initial'];
    patientCreditInitial = json['patient_credit_initial'];
    patientBalanceInitial = json['patient_balance_initial'];
    patientUsername = json['patient_username'];
    patientPassword = json['patient_password'];
    patientGender = json['patient_gender'];
    patientOrganization = json['patient_organization'];
    patientDescription = json['patient_description'];
    patientCountry = json['patient_country'];
    patientOrders = json['patient_orders'];
    patientAddTime = json['patient_add_time'];
    patientLoginTime = json['patient_login_time'];
    patientVerified = json['patient_verified'];
    patientStatus = json['patient_status'];
    patientAssessed = json['patient_assessed'];
    patientAssessedNotes = json['patient_assessed_notes'];
    patientForcePassword = json['patient_force_password'];
    patientProfilepicture = json['patient_profilepicture'];
    patientCoverpicture = json['patient_coverpicture'];
    patientWebsite = json['patient_website'];
    patientRememberMeKey = json['patient_remember_me_key'];
    patientRememberMeTime = json['patient_remember_me_time'];
    patientIp = json['patient_ip'];
    patientLip = json['patient_lip'];
    patientMylang = json['patient_mylang'];
    patientMycountry = json['patient_mycountry'];
    patientFacebookConnected = json['patient_facebook_connected'];
    patientFacebookId = json['patient_facebook_id'];
    patientVcode = json['patient_vcode'];
    patientVcodeTime = json['patient_vcode_time'];
    patientResetVcode = json['patient_reset_vcode'];
    patientResetVcodeTime = json['patient_reset_vcode_time'];
    patientGoogleConnected = json['patient_google_connected'];
    patientGoogleId = json['patient_google_id'];
    patientCity = json['patient_city'];
    patientStreet = json['patient_street'];
    patientBuilding = json['patient_building'];
    patientPhone2 = json['patient_phone_2'];
    patientAddressInfo = json['patient_address_info'];
    patientCode = json['patient_code'];
    patientPoints = json['patient_points'];
    patientWhatsappEnabled = json['patient_whatsapp_enabled'];
    patientWhatsappNumber = json['patient_whatsapp_number'];
    patientTimezone = json['patient_timezone'];
    patientIdcardFilename = json['patient_idcard_filename'];
    patientAccesstoken = json['patient_accesstoken'];
    patientFirebaseAccesstoken = json['patient_firebase_accesstoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['REVIEWID'] = this.rEVIEWID;
    data['PATIENTID'] = this.pATIENTID;
    data['PARTNERID'] = this.pARTNERID;
    data['review_stars'] = this.reviewStars;
    data['review_title'] = this.reviewTitle;
    data['review_txt'] = this.reviewTxt;
    data['review_active'] = this.reviewActive;
    data['review_date'] = this.reviewDate;
    data['review_time'] = this.reviewTime;
    data['review_published'] = this.reviewPublished;
    data['PATIENTAFID'] = this.pATIENTAFID;
    data['patient_uniqueid'] = this.patientUniqueid;
    data['patient_fullname'] = this.patientFullname;
    data['patient_type'] = this.patientType;
    data['patient_email'] = this.patientEmail;
    data['patient_phone'] = this.patientPhone;
    data['patient_taxes_id'] = this.patientTaxesId;
    data['patient_trading_id'] = this.patientTradingId;
    data['patient_sales'] = this.patientSales;
    data['patient_sales_total'] = this.patientSalesTotal;
    data['patient_sales_paid'] = this.patientSalesPaid;
    data['patient_sales_withdrawed'] = this.patientSalesWithdrawed;
    data['patient_debit'] = this.patientDebit;
    data['patient_credit'] = this.patientCredit;
    data['patient_balance'] = this.patientBalance;
    data['patient_debit_initial'] = this.patientDebitInitial;
    data['patient_credit_initial'] = this.patientCreditInitial;
    data['patient_balance_initial'] = this.patientBalanceInitial;
    data['patient_username'] = this.patientUsername;
    data['patient_password'] = this.patientPassword;
    data['patient_gender'] = this.patientGender;
    data['patient_organization'] = this.patientOrganization;
    data['patient_description'] = this.patientDescription;
    data['patient_country'] = this.patientCountry;
    data['patient_orders'] = this.patientOrders;
    data['patient_add_time'] = this.patientAddTime;
    data['patient_login_time'] = this.patientLoginTime;
    data['patient_verified'] = this.patientVerified;
    data['patient_status'] = this.patientStatus;
    data['patient_assessed'] = this.patientAssessed;
    data['patient_assessed_notes'] = this.patientAssessedNotes;
    data['patient_force_password'] = this.patientForcePassword;
    data['patient_profilepicture'] = this.patientProfilepicture;
    data['patient_coverpicture'] = this.patientCoverpicture;
    data['patient_website'] = this.patientWebsite;
    data['patient_remember_me_key'] = this.patientRememberMeKey;
    data['patient_remember_me_time'] = this.patientRememberMeTime;
    data['patient_ip'] = this.patientIp;
    data['patient_lip'] = this.patientLip;
    data['patient_mylang'] = this.patientMylang;
    data['patient_mycountry'] = this.patientMycountry;
    data['patient_facebook_connected'] = this.patientFacebookConnected;
    data['patient_facebook_id'] = this.patientFacebookId;
    data['patient_vcode'] = this.patientVcode;
    data['patient_vcode_time'] = this.patientVcodeTime;
    data['patient_reset_vcode'] = this.patientResetVcode;
    data['patient_reset_vcode_time'] = this.patientResetVcodeTime;
    data['patient_google_connected'] = this.patientGoogleConnected;
    data['patient_google_id'] = this.patientGoogleId;
    data['patient_city'] = this.patientCity;
    data['patient_street'] = this.patientStreet;
    data['patient_building'] = this.patientBuilding;
    data['patient_phone_2'] = this.patientPhone2;
    data['patient_address_info'] = this.patientAddressInfo;
    data['patient_code'] = this.patientCode;
    data['patient_points'] = this.patientPoints;
    data['patient_whatsapp_enabled'] = this.patientWhatsappEnabled;
    data['patient_whatsapp_number'] = this.patientWhatsappNumber;
    data['patient_timezone'] = this.patientTimezone;
    data['patient_idcard_filename'] = this.patientIdcardFilename;
    data['patient_accesstoken'] = this.patientAccesstoken;
    data['patient_firebase_accesstoken'] = this.patientFirebaseAccesstoken;
    return data;
  }
}


