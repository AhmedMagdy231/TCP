class SessionDetailsModel {
  SessionDetailsModel({
    required this.hasError,
    required this.errors,
    required this.messages,
    required this.data,
  });

  final bool? hasError;
  final List<dynamic> errors;
  final List<dynamic> messages;
  final Data? data;

  factory SessionDetailsModel.fromJson(Map<String, dynamic> json){
    return SessionDetailsModel(
      hasError: json["hasError"],
      errors: json["errors"] == null ? [] : List<dynamic>.from(json["errors"]!.map((x) => x)),
      messages: json["messages"] == null ? [] : List<dynamic>.from(json["messages"]!.map((x) => x)),
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.session,
  });

  final Session? session;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      session: json["session"] == null ? null : Session.fromJson(json["session"]),
    );
  }

}

class Session {
  Session({
    required this.sessionid,
    required this.slotid,
    required this.invid,
    required this.patientid,
    required this.partnerid,
    required this.roomid,
    required this.sessionDuration,
    required this.sessionType,
    required this.sessionDay,
    required this.sessionDate,
    required this.sessionStart,
    required this.sessionTimestamp,
    required this.sessionNotes,
    required this.sessionStatus,
    required this.sessionRepetition,
    required this.sessionRepeated,
    required this.sessionPartnerAttended,
    required this.sessionPartnerRated,
    required this.sessionPartnerNotes,
    required this.sessionPartnerRating,
    required this.sessionPartnerRatingPublished,
    required this.sessionPatientAttended,
    required this.sessionPatientRated,
    required this.sessionPatientNotes,
    required this.sessionPatientRating,
    required this.sessionNotificationReminderSent,
    required this.sessionNotificationReadySent,
    required this.sessionNotificationLateSent,
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
    required this.partnerDebit,
    required this.partnerCredit,
    required this.partnerBalance,
    required this.partnerTokens,
    required this.partnerAccesstoken,
    required this.partnerFirebaseAccesstoken,
    required this.sessionDateDisplay,
    required this.sessionStartDisplay,
    required this.status,
  });

  final String? sessionid;
  final String? slotid;
  final String? invid;
  final String? patientid;
  final String? partnerid;
  final String? roomid;
  final String? sessionDuration;
  final String? sessionType;
  final String? sessionDay;
  final String? sessionDate;
  final String? sessionStart;
  final String? sessionTimestamp;
  final String? sessionNotes;
  final String? sessionStatus;
  final String? sessionRepetition;
  final String? sessionRepeated;
  final String? sessionPartnerAttended;
  final String? sessionPartnerRated;
  final String? sessionPartnerNotes;
  final String? sessionPartnerRating;
  final String? sessionPartnerRatingPublished;
  final String? sessionPatientAttended;
  final String? sessionPatientRated;
  final String? sessionPatientNotes;
  final String? sessionPatientRating;
  final String? sessionNotificationReminderSent;
  final String? sessionNotificationReadySent;
  final String? sessionNotificationLateSent;
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
  final String? partnerDebit;
  final String? partnerCredit;
  final String? partnerBalance;
  final String? partnerTokens;
  final String? partnerAccesstoken;
  final String? partnerFirebaseAccesstoken;
  final String? sessionDateDisplay;
  final String? sessionStartDisplay;
  final String? status;

  factory Session.fromJson(Map<String, dynamic> json){
    return Session(
      sessionid: json["SESSIONID"],
      slotid: json["SLOTID"],
      invid: json["INVID"],
      patientid: json["PATIENTID"],
      partnerid: json["PARTNERID"],
      roomid: json["ROOMID"],
      sessionDuration: json["session_duration"],
      sessionType: json["session_type"],
      sessionDay: json["session_day"],
      sessionDate: json["session_date"],
      sessionStart: json["session_start"],
      sessionTimestamp: json["session_timestamp"],
      sessionNotes: json["session_notes"],
      sessionStatus: json["session_status"],
      sessionRepetition: json["session_repetition"],
      sessionRepeated: json["session_repeated"],
      sessionPartnerAttended: json["session_partner_attended"],
      sessionPartnerRated: json["session_partner_rated"],
      sessionPartnerNotes: json["session_partner_notes"],
      sessionPartnerRating: json["session_partner_rating"],
      sessionPartnerRatingPublished: json["session_partner_rating_published"],
      sessionPatientAttended: json["session_patient_attended"],
      sessionPatientRated: json["session_patient_rated"],
      sessionPatientNotes: json["session_patient_notes"],
      sessionPatientRating: json["session_patient_rating"],
      sessionNotificationReminderSent: json["session_notification_reminder_sent"],
      sessionNotificationReadySent: json["session_notification_ready_sent"],
      sessionNotificationLateSent: json["session_notification_late_sent"],
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
      partnerDebit: json["partner_debit"],
      partnerCredit: json["partner_credit"],
      partnerBalance: json["partner_balance"],
      partnerTokens: json["partner_tokens"],
      partnerAccesstoken: json["partner_accesstoken"],
      partnerFirebaseAccesstoken: json["partner_firebase_accesstoken"],
      sessionDateDisplay: json["session_date_display"] ,
      sessionStartDisplay: json["session_start_display"],
      status: json["status"],
    );
  }

}
