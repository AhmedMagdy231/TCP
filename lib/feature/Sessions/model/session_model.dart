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
  Data({
    required this.resultsTotal,
    required this.pageCurrent,
    required this.pagePrev,
    required this.pageNext,
    required this.pageMax,
    required this.sessions,
  });

  final String? resultsTotal;
  final int? pageCurrent;
  final dynamic pagePrev;
  final int? pageNext;
  final int? pageMax;
  final List<Sessions> sessions;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      resultsTotal: json["resultsTotal"],
      pageCurrent: json["pageCurrent"],
      pagePrev: json["pagePrev"],
      pageNext: json["pageNext"],
      pageMax: json["pageMax"],
      sessions: json["sessions"] == null ? [] : List<Sessions>.from(json["sessions"]!.map((x) => Sessions.fromJson(x))),
    );
  }

}

class Sessions {
  Sessions({
    required this.sessionid,
    required this.slotid,
    required this.invid,
    required this.patientid,
    required this.partnerid,
    required this.roomid,
    required this.sessionDuration,
    required this.sessionOther,
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
    required this.sessionPatientFullname,
    required this.sessionPatientPhone,
    required this.sessionPatientPhone2,
    required this.sessionPatientAttended,
    required this.sessionPatientRated,
    required this.sessionPatientNotes,
    required this.sessionPatientRating,
    required this.sessionNotificationReminderSent,
    required this.sessionNotificationReadySent,
    required this.sessionNotificationLateSent,
    required this.specialtyid,
    required this.partnerName,
    required this.partnerPosition,
    required this.partnerDescription,
    required this.partnerSessionPrice,
    required this.partnerSessionDiscount,
    required this.partnerContactPhone,
    required this.partnerContactEmail,
    required this.partnerContactWhatsapp,
    required this.partnerPic,
    required this.partnerReviewsTotal,
    required this.partnerReviewsAvg,
    required this.branchid,
    required this.roomName,
    required this.roomPic,
    required this.roomStatus,
    required this.roomDescription,
    required this.roomOccupied,
    required this.roomType,
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
  final String? sessionOther;
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
  final String? sessionPatientFullname;
  final String? sessionPatientPhone;
  final String? sessionPatientPhone2;
  final String? sessionPatientAttended;
  final String? sessionPatientRated;
  final String? sessionPatientNotes;
  final String? sessionPatientRating;
  final String? sessionNotificationReminderSent;
  final String? sessionNotificationReadySent;
  final String? sessionNotificationLateSent;
  final String? specialtyid;
  final String? partnerName;
  final String? partnerPosition;
  final String? partnerDescription;
  final String? partnerSessionPrice;
  final String? partnerSessionDiscount;
  final String? partnerContactPhone;
  final String? partnerContactEmail;
  final String? partnerContactWhatsapp;
  final String? partnerPic;
  final String? partnerReviewsTotal;
  final String? partnerReviewsAvg;
  final String? branchid;
  final String? roomName;
  final String? roomPic;
  final String? roomStatus;
  final String? roomDescription;
  final String? roomOccupied;
  final String? roomType;
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
  final String? sessionDateDisplay;
  final String? sessionStartDisplay;
  final String? status;

  factory Sessions.fromJson(Map<String, dynamic> json){
    return Sessions(
      sessionid: json["SESSIONID"],
      slotid: json["SLOTID"],
      invid: json["INVID"],
      patientid: json["PATIENTID"],
      partnerid: json["PARTNERID"],
      roomid: json["ROOMID"],
      sessionDuration: json["session_duration"],
      sessionOther: json["session_other"],
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
      sessionPatientFullname: json["session_patient_fullname"],
      sessionPatientPhone: json["session_patient_phone"],
      sessionPatientPhone2: json["session_patient_phone_2"],
      sessionPatientAttended: json["session_patient_attended"],
      sessionPatientRated: json["session_patient_rated"],
      sessionPatientNotes: json["session_patient_notes"],
      sessionPatientRating: json["session_patient_rating"],
      sessionNotificationReminderSent: json["session_notification_reminder_sent"],
      sessionNotificationReadySent: json["session_notification_ready_sent"],
      sessionNotificationLateSent: json["session_notification_late_sent"],
      specialtyid: json["SPECIALTYID"],
      partnerName: json["partner_name"],
      partnerPosition: json["partner_position"],
      partnerDescription: json["partner_description"],
      partnerSessionPrice: json["partner_session_price"],
      partnerSessionDiscount: json["partner_session_discount"],
      partnerContactPhone: json["partner_contact_phone"],
      partnerContactEmail: json["partner_contact_email"],
      partnerContactWhatsapp: json["partner_contact_whatsapp"],
      partnerPic: json["partner_pic"],
      partnerReviewsTotal: json["partner_reviews_total"],
      partnerReviewsAvg: json["partner_reviews_avg"],
      branchid: json["BRANCHID"],
      roomName: json["room_name"],
      roomPic: json["room_pic"],
      roomStatus: json["room_status"],
      roomDescription: json["room_description"],
      roomOccupied: json["room_occupied"],
      roomType: json["room_type"],
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
      sessionDateDisplay: json["session_date_display"],
      sessionStartDisplay: json["session_start_display"],
      status: json["status"],
    );
  }

}
