class ArticleModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
 late Data? data;

  ArticleModel.formJson(Map<String,dynamic> json){
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
  Page? page;
  List<dynamic>? similarPages;




  Data.fromJson(Map<String, dynamic> json) {
    page = json['page'] != null ? Page.fromJson(json['page']) : null;

    // if (json['similar_pages'] != null) {
    //   similarPages = <Null>[];
    //   json['similar_pages'].forEach((v) {
    //     similarPages!.add(new Null.fromJson(v));
    //   });
    // }

  }




}

class Page {
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

  Page(
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

  Page.fromJson(Map<String, dynamic> json) {
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


