class NotificationModel {
  NotificationModel({
    required this.hasError,
    required this.errors,
    required this.messages,
    required this.data,
  });

  final bool? hasError;
  final List<dynamic> errors;
  final List<dynamic> messages;
  final Data? data;

  factory NotificationModel.fromJson(Map<String, dynamic> json){
    return NotificationModel(
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
    required this.notification,
  });

  final String? resultsTotal;
  final int? pageCurrent;
  final dynamic pagePrev;
  final dynamic pageNext;
  final int? pageMax;
  final List<PatientsNotification> notification;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      resultsTotal: json["resultsTotal"],
      pageCurrent: json["pageCurrent"],
      pagePrev: json["pagePrev"],
      pageNext: json["pageNext"],
      pageMax: json["pageMax"],
      notification: json["patients_notifications"] == null ? [] : List<PatientsNotification>.from(json["patients_notifications"]!.map((x) => PatientsNotification.fromJson(x))),
    );
  }

}

class PatientsNotification {
  PatientsNotification({
    required this.patinotificationid,
    required this.patientid,
    required this.patinotificationMessage,
    required this.patinotificationMessageAr,
    required this.patinotificationTime,
    required this.patinotificationDate,
    required this.patinotificationRead,
    required this.patinotificationAction,
    required this.patinotificationActionId,
    required this.patinotificationIcon,
  });

  final String? patinotificationid;
  final String? patientid;
  final String? patinotificationMessage;
  final String? patinotificationMessageAr;
  final String? patinotificationTime;
  final String? patinotificationDate;
  String? patinotificationRead;
  final String? patinotificationAction;
  final String? patinotificationActionId;
  final String? patinotificationIcon;

  factory PatientsNotification.fromJson(Map<String, dynamic> json){
    return PatientsNotification(
      patinotificationid: json["PATINOTIFICATIONID"],
      patientid: json["PATIENTID"],
      patinotificationMessage: json["patinotification_message"],
      patinotificationMessageAr: json["patinotification_message_ar"],
      patinotificationTime: json["patinotification_time"],
      patinotificationDate: json["patinotification_date"],
      patinotificationRead: json["patinotification_read"],
      patinotificationAction: json["patinotification_action"],
      patinotificationActionId: json["patinotification_action_id"],
      patinotificationIcon: json["patinotification_icon"],
    );
  }

}
