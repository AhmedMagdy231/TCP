class SettingModel {
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;
  late Data? data;

  SettingModel.formJson(Map<String,dynamic> json){
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
  String? systemWhatsappEnabled;
  String? websiteContactWebsite;
  String? websiteContactEmail;
  String? websiteContactPhone;
  String? websiteContactFax;
  String? websiteContactWhatsapp;
  String? websiteContactAddress;
  String? websiteContactAddress2;
  String? websiteContactMapsX;
  String? websiteContactMapsY;
  String? websiteSocialFacebookUrl;
  String? websiteSocialTwitterUrl;
  String? websiteSocialInstagramUrl;
  String? websiteSocialYoutubeUrl;
  String? websiteSocialLinkedinUrl;
  String? websiteSocialPinterestUrl;
  String? websitePagesEnabled;
  String? websiteLogosEnabled;
  String? websitePartnersNavigationMode;
  String? websitePartnersReviewsEnabled;
  String? websiteReviewsEnabled;
  List<MainSpecialties>? mainSpecialties;

  Data(
      {this.systemWhatsappEnabled,
        this.websiteContactWebsite,
        this.websiteContactEmail,
        this.websiteContactPhone,
        this.websiteContactFax,
        this.websiteContactWhatsapp,
        this.websiteContactAddress,
        this.websiteContactAddress2,
        this.websiteContactMapsX,
        this.websiteContactMapsY,
        this.websiteSocialFacebookUrl,
        this.websiteSocialTwitterUrl,
        this.websiteSocialInstagramUrl,
        this.websiteSocialYoutubeUrl,
        this.websiteSocialLinkedinUrl,
        this.websiteSocialPinterestUrl,
        this.websitePagesEnabled,
        this.websiteLogosEnabled,
        this.websitePartnersNavigationMode,
        this.websitePartnersReviewsEnabled,
        this.websiteReviewsEnabled,
        this.mainSpecialties});

  Data.fromJson(Map<String, dynamic> json) {
    systemWhatsappEnabled = json['system_whatsapp_enabled'];
    websiteContactWebsite = json['website_contact_website'];
    websiteContactEmail = json['website_contact_email'];
    websiteContactPhone = json['website_contact_phone'];
    websiteContactFax = json['website_contact_fax'];
    websiteContactWhatsapp = json['website_contact_whatsapp'];
    websiteContactAddress = json['website_contact_address'];
    websiteContactAddress2 = json['website_contact_address_2'];
    websiteContactMapsX = json['website_contact_maps_x'];
    websiteContactMapsY = json['website_contact_maps_y'];
    websiteSocialFacebookUrl = json['website_social_facebook_url'];
    websiteSocialTwitterUrl = json['website_social_twitter_url'];
    websiteSocialInstagramUrl = json['website_social_instagram_url'];
    websiteSocialYoutubeUrl = json['website_social_youtube_url'];
    websiteSocialLinkedinUrl = json['website_social_linkedin_url'];
    websiteSocialPinterestUrl = json['website_social_pinterest_url'];
    websitePagesEnabled = json['website_pages_enabled'];
    websiteLogosEnabled = json['website_logos_enabled'];
    websitePartnersNavigationMode = json['website_partners_navigation_mode'];
    websitePartnersReviewsEnabled = json['website_partners_reviews_enabled'];
    websiteReviewsEnabled = json['website_reviews_enabled'];
    if (json['main_specialties'] != null) {
      mainSpecialties = <MainSpecialties>[];
      json['main_specialties'].forEach((v) {
        mainSpecialties!.add(new MainSpecialties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['system_whatsapp_enabled'] = this.systemWhatsappEnabled;
    data['website_contact_website'] = this.websiteContactWebsite;
    data['website_contact_email'] = this.websiteContactEmail;
    data['website_contact_phone'] = this.websiteContactPhone;
    data['website_contact_fax'] = this.websiteContactFax;
    data['website_contact_whatsapp'] = this.websiteContactWhatsapp;
    data['website_contact_address'] = this.websiteContactAddress;
    data['website_contact_address_2'] = this.websiteContactAddress2;
    data['website_contact_maps_x'] = this.websiteContactMapsX;
    data['website_contact_maps_y'] = this.websiteContactMapsY;
    data['website_social_facebook_url'] = this.websiteSocialFacebookUrl;
    data['website_social_twitter_url'] = this.websiteSocialTwitterUrl;
    data['website_social_instagram_url'] = this.websiteSocialInstagramUrl;
    data['website_social_youtube_url'] = this.websiteSocialYoutubeUrl;
    data['website_social_linkedin_url'] = this.websiteSocialLinkedinUrl;
    data['website_social_pinterest_url'] = this.websiteSocialPinterestUrl;
    data['website_pages_enabled'] = this.websitePagesEnabled;
    data['website_logos_enabled'] = this.websiteLogosEnabled;
    data['website_partners_navigation_mode'] =
        this.websitePartnersNavigationMode;
    data['website_partners_reviews_enabled'] =
        this.websitePartnersReviewsEnabled;
    data['website_reviews_enabled'] = this.websiteReviewsEnabled;
    if (this.mainSpecialties != null) {
      data['main_specialties'] =
          this.mainSpecialties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainSpecialties {
  String? sPECIALTYID;
  String? pARENTSPECID;
  String? specialtyTitle;
  String? specialtyDescription;
  String? specialtyPic;
  String? specialtyIcon;
  String? specialtyActive;
  String? specialtyPriority;
  String? specialtyPartners;

  MainSpecialties(
      {this.sPECIALTYID,
        this.pARENTSPECID,
        this.specialtyTitle,
        this.specialtyDescription,
        this.specialtyPic,
        this.specialtyIcon,
        this.specialtyActive,
        this.specialtyPriority,
        this.specialtyPartners});

  MainSpecialties.fromJson(Map<String, dynamic> json) {
    sPECIALTYID = json['SPECIALTYID'];
    pARENTSPECID = json['PARENTSPECID'];
    specialtyTitle = json['specialty_title'];
    specialtyDescription = json['specialty_description'];
    specialtyPic = json['specialty_pic'];
    specialtyIcon = json['specialty_icon'];
    specialtyActive = json['specialty_active'];
    specialtyPriority = json['specialty_priority'];
    specialtyPartners = json['specialty_partners'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SPECIALTYID'] = this.sPECIALTYID;
    data['PARENTSPECID'] = this.pARENTSPECID;
    data['specialty_title'] = this.specialtyTitle;
    data['specialty_description'] = this.specialtyDescription;
    data['specialty_pic'] = this.specialtyPic;
    data['specialty_icon'] = this.specialtyIcon;
    data['specialty_active'] = this.specialtyActive;
    data['specialty_priority'] = this.specialtyPriority;
    data['specialty_partners'] = this.specialtyPartners;
    return data;
  }
}