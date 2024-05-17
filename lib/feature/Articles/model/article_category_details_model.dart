class ArticlesCategoryDetailsModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  ArticlesCategoryDetailsModel.formJson(Map<String,dynamic> json){
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
  dynamic pagePrev;
  dynamic pageNext;
  int? pageMax;
  List<Pages>? pages;
  PagesCat? pagesCat;
  List<LatestPages>? latestPages;
  List<LatestPartners>? latestPartners;



  Data.fromJson(Map<String, dynamic> json) {
    resultsTotal = json['resultsTotal'];
    pageCurrent = json['pageCurrent'];
    pagePrev = json['pagePrev'];
    pageNext = json['pageNext'];
    pageMax = json['pageMax'];
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(new Pages.fromJson(v));
      });
    }
    pagesCat = json['pages_cat'] != null
        ? new PagesCat.fromJson(json['pages_cat'])
        : null;
    if (json['latest_pages'] != null) {
      latestPages = <LatestPages>[];
      json['latest_pages'].forEach((v) {
        latestPages!.add(new LatestPages.fromJson(v));
      });
    }
    if (json['latest_partners'] != null) {
      latestPartners = <LatestPartners>[];
      json['latest_partners'].forEach((v) {
        latestPartners!.add(new LatestPartners.fromJson(v));
      });
    }
  }


}

class Pages {
  String? pAGEID;
  String? pAGESCATID;
  String? pageName;
  String? pageActive;
  String? pagePriority;
  String? pageDescription;
  String? pagePic;
  String? pageTime;
  String? pageDate;
  String? pagescatTitle;
  String? pagescatDescription;
  String? pagescatPages;
  String? pagescatActive;
  String? pagescatPic;

  Pages(
      {this.pAGEID,
        this.pAGESCATID,
        this.pageName,
        this.pageActive,
        this.pagePriority,
        this.pageDescription,
        this.pagePic,
        this.pageTime,
        this.pageDate,
        this.pagescatTitle,
        this.pagescatDescription,
        this.pagescatPages,
        this.pagescatActive,
        this.pagescatPic});

  Pages.fromJson(Map<String, dynamic> json) {
    pAGEID = json['PAGEID'];
    pAGESCATID = json['PAGESCATID'];
    pageName = json['page_name'];
    pageActive = json['page_active'];
    pagePriority = json['page_priority'];
    pageDescription = json['page_description'];
    pagePic = json['page_pic'];
    pageTime = json['page_time'];
    pageDate = json['page_date'];
    pagescatTitle = json['pagescat_title'];
    pagescatDescription = json['pagescat_description'];
    pagescatPages = json['pagescat_pages'];
    pagescatActive = json['pagescat_active'];
    pagescatPic = json['pagescat_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PAGEID'] = this.pAGEID;
    data['PAGESCATID'] = this.pAGESCATID;
    data['page_name'] = this.pageName;
    data['page_active'] = this.pageActive;
    data['page_priority'] = this.pagePriority;
    data['page_description'] = this.pageDescription;
    data['page_pic'] = this.pagePic;
    data['page_time'] = this.pageTime;
    data['page_date'] = this.pageDate;
    data['pagescat_title'] = this.pagescatTitle;
    data['pagescat_description'] = this.pagescatDescription;
    data['pagescat_pages'] = this.pagescatPages;
    data['pagescat_active'] = this.pagescatActive;
    data['pagescat_pic'] = this.pagescatPic;
    return data;
  }
}

class PagesCat {
  String? pAGESCATID;
  String? pagescatTitle;
  String? pagescatDescription;
  String? pagescatPages;
  String? pagescatActive;
  String? pagescatPic;

  PagesCat(
      {this.pAGESCATID,
        this.pagescatTitle,
        this.pagescatDescription,
        this.pagescatPages,
        this.pagescatActive,
        this.pagescatPic});

  PagesCat.fromJson(Map<String, dynamic> json) {
    pAGESCATID = json['PAGESCATID'];
    pagescatTitle = json['pagescat_title'];
    pagescatDescription = json['pagescat_description'];
    pagescatPages = json['pagescat_pages'];
    pagescatActive = json['pagescat_active'];
    pagescatPic = json['pagescat_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PAGESCATID'] = this.pAGESCATID;
    data['pagescat_title'] = this.pagescatTitle;
    data['pagescat_description'] = this.pagescatDescription;
    data['pagescat_pages'] = this.pagescatPages;
    data['pagescat_active'] = this.pagescatActive;
    data['pagescat_pic'] = this.pagescatPic;
    return data;
  }
}

class LatestPages {
  String? pAGEID;
  String? pAGESCATID;
  String? pageName;
  String? pageActive;
  String? pagePriority;
  String? pageDescription;
  String? pagePic;
  String? pageTime;
  String? pageDate;

  LatestPages(
      {this.pAGEID,
        this.pAGESCATID,
        this.pageName,
        this.pageActive,
        this.pagePriority,
        this.pageDescription,
        this.pagePic,
        this.pageTime,
        this.pageDate});

  LatestPages.fromJson(Map<String, dynamic> json) {
    pAGEID = json['PAGEID'];
    pAGESCATID = json['PAGESCATID'];
    pageName = json['page_name'];
    pageActive = json['page_active'];
    pagePriority = json['page_priority'];
    pageDescription = json['page_description'];
    pagePic = json['page_pic'];
    pageTime = json['page_time'];
    pageDate = json['page_date'];
  }


}

class LatestPartners {
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



  LatestPartners.fromJson(Map<String, dynamic> json) {
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
