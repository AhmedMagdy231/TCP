class CartModel {
  CartModel({
    required this.hasError,
    required this.errors,
    required this.messages,
    required this.data,
  });

  final bool? hasError;
  final List<String> errors;
  final List<String> messages;
  final Data? data;

  factory CartModel.fromJson(Map<String, dynamic> json){
    return CartModel(
      hasError: json["hasError"],
      errors: json["errors"] == null ? [] : List<String>.from(json["errors"]!.map((x) => x)),
      messages: json["messages"] == null ? [] : List<String>.from(json["messages"]!.map((x) => x)),
      data: json["data"] is List ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.sessions,
    required this.invCoupon,
    required this.invPrice,
    required this.invDiscount,
    required this.invNetPrice,
    required this.invCouponDiscount,
    required this.invTotal,
    required this.hasError,
    required this.errors,
  });

  final List<Session> sessions;
  final String? invCoupon;
  final int? invPrice;
  final int? invDiscount;
  final int? invNetPrice;
  final int? invCouponDiscount;
  final int? invTotal;
  final bool? hasError;
  final List<dynamic> errors;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      sessions: json["sessions"] == null ? [] : List<Session>.from(json["sessions"]!.map((x) => Session.fromJson(x))),
      invCoupon: json["inv_coupon"],
      invPrice: json["inv_price"],
      invDiscount: json["inv_discount"],
      invNetPrice: json["inv_netprice"],
      invCouponDiscount: json["inv_coupon_discount"],
      invTotal: json["inv_total"],
      hasError: json["hasError"],
      errors: json["errors"] == null ? [] : List<dynamic>.from(json["errors"]!.map((x) => x)),
    );
  }

}

class Session {
  Session({
    required this.sessionUniqid,
    required this.slotid,
    required this.partnerid,
    required this.roomid,
    required this.branchid,
    required this.partnerName,
    required this.partnerPic,
    required this.partnerPosition,
    required this.partnerPhone,
    required this.partnerEmail,
    required this.specialtyTitle,
    required this.sessionPrice,
    required this.sessionDiscount,
    required this.sessionNetprice,
    required this.sessionDate,
    required this.sessionStart,
    required this.sessionTimestamp,
  });

  final String? sessionUniqid;
  final int? slotid;
  final String? partnerid;
  final String? roomid;
  final String? branchid;
  final String? partnerName;
  final String? partnerPic;
  final String? partnerPosition;
  final String? partnerPhone;
  final String? partnerEmail;
  final String? specialtyTitle;
  final int? sessionPrice;
  final int? sessionDiscount;
  final int? sessionNetprice;
  final String? sessionDate;
  final String? sessionStart;
  final int? sessionTimestamp;

  factory Session.fromJson(Map<String, dynamic> json){
    return Session(
      sessionUniqid: json["session_uniqid"],
      slotid: json["SLOTID"],
      partnerid: json["PARTNERID"],
      roomid: json["ROOMID"],
      branchid: json["BRANCHID"],
      partnerName: json["partner_name"],
      partnerPic: json["partner_pic"],
      partnerPosition: json["partner_position"],
      partnerPhone: json["partner_phone"],
      partnerEmail: json["partner_email"],
      specialtyTitle: json["specialty_title"],
      sessionPrice: json["session_price"],
      sessionDiscount: json["session_discount"],
      sessionNetprice: json["session_netprice"],
      sessionDate: json["session_date"],
      sessionStart: json["session_start"],
      sessionTimestamp: json["session_timestamp"],
    );
  }

}
