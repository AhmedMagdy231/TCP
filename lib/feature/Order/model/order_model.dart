class OrderModel {
  OrderModel({
    required this.hasError,
    required this.errors,
    required this.messages,
    required this.data,
  });

  final bool? hasError;
  final List<dynamic> errors;
  final List<dynamic> messages;
  final Data? data;

  factory OrderModel.fromJson(Map<String, dynamic> json){
    return OrderModel(
      hasError: json["hasError"],
      errors: json["errors"] == null ? [] : List<dynamic>.from(json["errors"]!.map((x) => x)),
      messages: json["messages"] == null ? [] : List<dynamic>.from(json["messages"]!.map((x) => x)),
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
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
    required this.invoices,
  });

  final String? resultsTotal;
  final int? pageCurrent;
  final dynamic pagePrev;
  final dynamic pageNext;
  final int? pageMax;
  final List<Invoice> invoices;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      resultsTotal: json["resultsTotal"],
      pageCurrent: json["pageCurrent"],
      pagePrev: json["pagePrev"],
      pageNext: json["pageNext"],
      pageMax: json["pageMax"],
      invoices: json["invoices"] == null ? [] : List<Invoice>.from(json["invoices"]!.map((x) => Invoice.fromJson(x))),
    );
  }

}

class Invoice {
  Invoice({
    required this.invid,
    required this.currencyid,
    required this.couponid,
    required this.partnerid,
    required this.patientid,
    required this.sessionid,
    required this.invDate,
    required this.invNum,
    required this.invPrice,
    required this.invDiscount,
    required this.invNetprice,
    required this.invCoupon,
    required this.invCouponThreshold,
    required this.invCouponMode,
    required this.invCouponValue,
    required this.invCouponDiscount,
    required this.invSubtotal,
    required this.invTaxes,
    required this.invTaxesTotal,
    required this.invTotal,
    required this.invPaid,
    required this.invWithdrawals,
    required this.invRemaining,
    required this.invStatus,
    required this.invNotes,
    required this.invPaymobOrderid,
    required this.invConversionRate,
    required this.invTotalConverted,
    required this.currencyName,
    required this.status,
  });


  final String? invid;
  final String? currencyid;
  final String? couponid;
  final String? partnerid;
  final String? patientid;
  final String? sessionid;
  final DateTime? invDate;
  final String? invNum;
  final String? invPrice;
  final String? invDiscount;
  final String? invNetprice;
  final String? invCoupon;
  final String? invCouponThreshold;
  final String? invCouponMode;
  final String? invCouponValue;
  final String? invCouponDiscount;
  final String? invSubtotal;
  final String? invTaxes;
  final String? invTaxesTotal;
  final String? invTotal;
  final String? invPaid;
  final String? invWithdrawals;
  final String? invRemaining;
  final String? invStatus;
  final String? invNotes;
  final String? invPaymobOrderid;
  final String? invConversionRate;
  final String? invTotalConverted;
  final String? currencyName;
  final String? status;

  factory Invoice.fromJson(Map<String, dynamic> json){
    return Invoice(
      invid: json["INVID"],
      currencyid: json["CURRENCYID"],
      couponid: json["COUPONID"],
      partnerid: json["PARTNERID"],
      patientid: json["PATIENTID"],
      sessionid: json["SESSIONID"],
      invDate: DateTime.tryParse(json["inv_date"] ?? ""),
      invNum: json["inv_num"],
      invPrice: json["inv_price"],
      invDiscount: json["inv_discount"],
      invNetprice: json["inv_netprice"],
      invCoupon: json["inv_coupon"],
      invCouponThreshold: json["inv_coupon_threshold"],
      invCouponMode: json["inv_coupon_mode"],
      invCouponValue: json["inv_coupon_value"],
      invCouponDiscount: json["inv_coupon_discount"],
      invSubtotal: json["inv_subtotal"],
      invTaxes: json["inv_taxes"],
      invTaxesTotal: json["inv_taxes_total"],
      invTotal: json["inv_total"],
      invPaid: json["inv_paid"],
      invWithdrawals: json["inv_withdrawals"],
      invRemaining: json["inv_remaining"],
      invStatus: json["inv_status"],
      invNotes: json["inv_notes"],
      invPaymobOrderid: json["inv_paymob_orderid"],
      invConversionRate: json["inv_conversion_rate"],
      invTotalConverted: json["inv_total_converted"],
      currencyName: json["currency_name"],
      status: json["status"],
    );
  }

}