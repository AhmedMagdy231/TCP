class NotificationModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  NotificationModel.formJson(Map<String,dynamic> json){
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
  String? resultsTotal;
  int? pageCurrent;
  int? pagePrev;
  int? pageNext;
  int? pageMax;
  List<Notifications>? notification;


  Data.fromJson(Map<String, dynamic> json) {
    resultsTotal = json['resultsTotal'];
    pageCurrent = json['pageCurrent'];
    pagePrev = json['pagePrev'];
    pageNext = json['pageNext'];
    pageMax = json['pageMax'];
    if (json['notifications'] != null) {
      notification = <Notifications>[];
      json['notifications'].forEach((v) {
        notification!.add(new Notifications.fromJson(v));
      });
    }
  }


}

class Notifications {
  String? sTUDENTID;
  String? nOTIFICATIONID;
  String? notificationMessage;
  String? notificationTime;
  String? notificationDate;
  String? notificationRead;
  String? notificationAction;
  String? notificationActionId;
  String? notificationIcon;



  Notifications.fromJson(Map<String, dynamic> json) {
    sTUDENTID = json['STUDENTID'];
    nOTIFICATIONID = json['NOTIFICATIONID'];
    notificationMessage = json['notification_message'];
    notificationTime = json['notification_time'];
    notificationDate = json['notification_date'];
    notificationRead = json['notification_read'];
    notificationAction = json['notification_action'];
    notificationActionId = json['notification_action_id'];
    notificationIcon = json['notification_icon'];
  }


}