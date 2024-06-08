class DoctorDetailsModel {
  DoctorDetailsModel({
    required this.hasError,
    required this.errors,
    required this.messages,
    required this.data,
  });

  final bool? hasError;
  final List<dynamic> errors;
  final List<dynamic> messages;
  final Data? data;

  factory DoctorDetailsModel.fromJson(Map<String, dynamic> json){
    return DoctorDetailsModel(
      hasError: json["hasError"],
      errors: json["errors"] == null ? [] : List<dynamic>.from(json["errors"]!.map((x) => x)),
      messages: json["messages"] == null ? [] : List<dynamic>.from(json["messages"]!.map((x) => x)),
      data: json["data"] is List ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.partner,
    required this.partnersPosts,
    required this.similarPartners,
    required this.partnersReviews,
    required this.branches,
  });

  final Partner? partner;
  final List<PartnersPost> partnersPosts;
  final List<Partner> similarPartners;
  final List<PartnersReviews> partnersReviews;
  final List<Branches> branches;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      partner: json["partner"] == null ? null : Partner.fromJson(json["partner"]),
      partnersPosts: json["partners_posts"] == null ? [] : List<PartnersPost>.from(json["partners_posts"]!.map((x) => PartnersPost.fromJson(x))),
      similarPartners: json["similar_partners"] == null ? [] : List<Partner>.from(json["similar_partners"]!.map((x) => Partner.fromJson(x))),
      partnersReviews: json["partners_reviews"] == null ? [] : List<PartnersReviews>.from(json['partners_reviews']!.map((x) => PartnersReviews.fromJson(x))),
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

class Partner {
  Partner({
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
    required this.partnerDescription,
    required this.partnerBookmark,
  });

  final String? partnerid;
  final String? specialtyid;
  final String? partnerName;
  final String? partnerDescription;
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
  final String? partnerBookmark;

  factory Partner.fromJson(Map<String, dynamic> json){
    return Partner(
      partnerid: json["PARTNERID"],
      specialtyid: json["SPECIALTYID"],
      partnerName: json["partner_name"],
      partnerDescription: json['partner_description'],
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
      partnerBookmark: json['PARTBOOMARKID'].toString(),
    );
  }

}

class PartnersPost {
  PartnersPost({
    required this.parpostid,
    required this.partnerid,
    required this.parpostTitle,
    required this.parpostFilename,
    required this.parpostCover,
  });

  final String? parpostid;
  final String? partnerid;
  final String? parpostTitle;
  final String? parpostFilename;
  final String? parpostCover;

  factory PartnersPost.fromJson(Map<String, dynamic> json){
    return PartnersPost(
      parpostid: json["PARPOSTID"],
      partnerid: json["PARTNERID"],
      parpostTitle: json["parpost_title"],
      parpostFilename: json["parpost_filename"],
      parpostCover: json["parpost_cover"],
    );
  }

}


class PartnersReviews {
  String? rEVIEWID;
  String? pATIENTID;
  String? pARTNERID;
  String? reviewStars;
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
    reviewTxt = json['review_comment'];
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


}
