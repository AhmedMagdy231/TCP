
class SessionModel {
  SessionModel({
    required this.hasError,
    required this.errors,
    required this.messages,
    required this.data,
  });

  final bool? hasError;
  final List<dynamic> errors;
  final List<dynamic> messages;
  final Data? data;

  factory SessionModel.fromJson(Map<String, dynamic> json){
    return SessionModel(
      hasError: json["hasError"],
      errors: json["errors"] == null ? [] : List<dynamic>.from(json["errors"]!.map((x) => x)),
      messages: json["messages"] == null ? [] : List<dynamic>.from(json["messages"]!.map((x) => x)),
      data: json["data"] is List ? null : Data.fromJson(json["data"]),
    );
  }

}



class Data {
  String? resultsTotal;
  int? pageCurrent;
  dynamic pagePrev;
  dynamic pageNext;
  int? pageMax;
  List<Sessions>? sessions;

  Data(
      {this.resultsTotal,
        this.pageCurrent,
        this.pagePrev,
        this.pageNext,
        this.pageMax,
        this.sessions});

  Data.fromJson(Map<String, dynamic> json) {
    resultsTotal = json['resultsTotal'];
    pageCurrent = json['pageCurrent'];
    pagePrev = json['pagePrev'];
    pageNext = json['pageNext'];
    pageMax = json['pageMax'];
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(new Sessions.fromJson(v));
      });
    }
  }


}

class Sessions {
  String? sESSIONID;
  String? sLOTID;
  String? iNVID;
  String? pATIENTID;
  String? pARTNERID;
  String? rOOMID;
  String? sessionDuration;
  String? sessionType;
  String? sessionDay;
  String? sessionDate;
  String? sessionStart;
  String? sessionTimestamp;
  String? sessionNotes;
  String? sessionStatus;
  String? sessionRepetition;
  String? sessionRepeated;
  String? sessionPartnerAttended;
  String? sessionPartnerRated;
  String? sessionPartnerNotes;
  String? sessionPartnerRating;
  String? sessionPartnerRatingPublished;
  String? sessionPatientAttended;
  String? sessionPatientRated;
  String? sessionPatientNotes;
  String? sessionPatientRating;
  String? sessionNotificationReminderSent;
  String? sessionNotificationReadySent;
  String? sessionNotificationLateSent;
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
  String? partnerContactPhone;
  String? partnerContactEmail;
  String? partnerContactWhatsapp;
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
  String? partnerPurchasesWithdrawed;
  String? partnerDebit;
  String? partnerCredit;
  String? partnerBalance;
  String? partnerTokens;
  String? partnerAccesstoken;
  String? partnerFirebaseAccesstoken;
  String? sessionDateDisplay;
  String? sessionStartDisplay;
  String? status;


  Sessions.fromJson(Map<String, dynamic> json) {
    sESSIONID = json['SESSIONID'];
    sLOTID = json['SLOTID'];
    iNVID = json['INVID'];
    pATIENTID = json['PATIENTID'];
    pARTNERID = json['PARTNERID'];
    rOOMID = json['ROOMID'];
    sessionDuration = json['session_duration'];
    sessionType = json['session_type'];
    sessionDay = json['session_day'];
    sessionDate = json['session_date'];
    sessionStart = json['session_start'];
    sessionTimestamp = json['session_timestamp'];
    sessionNotes = json['session_notes'];
    sessionStatus = json['session_status'];
    sessionRepetition = json['session_repetition'];
    sessionRepeated = json['session_repeated'];
    sessionPartnerAttended = json['session_partner_attended'];
    sessionPartnerRated = json['session_partner_rated'];
    sessionPartnerNotes = json['session_partner_notes'];
    sessionPartnerRating = json['session_partner_rating'];
    sessionPartnerRatingPublished = json['session_partner_rating_published'];
    sessionPatientAttended = json['session_patient_attended'];
    sessionPatientRated = json['session_patient_rated'];
    sessionPatientNotes = json['session_patient_notes'];
    sessionPatientRating = json['session_patient_rating'];
    sessionNotificationReminderSent =
    json['session_notification_reminder_sent'];
    sessionNotificationReadySent = json['session_notification_ready_sent'];
    sessionNotificationLateSent = json['session_notification_late_sent'];
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
    partnerContactPhone = json['partner_contact_phone'];
    partnerContactEmail = json['partner_contact_email'];
    partnerContactWhatsapp = json['partner_contact_whatsapp'];
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
    partnerPurchasesWithdrawed = json['partner_purchases_withdrawed'];
    partnerDebit = json['partner_debit'];
    partnerCredit = json['partner_credit'];
    partnerBalance = json['partner_balance'];
    partnerTokens = json['partner_tokens'];
    partnerAccesstoken = json['partner_accesstoken'];
    partnerFirebaseAccesstoken = json['partner_firebase_accesstoken'];
    sessionDateDisplay = json['session_date_display'];
    sessionStartDisplay = json['session_start_display'];
    status = json['status'];
  }

}
