class AddReviewModel{
  late bool hasError;
  late List<dynamic> errors;
  late List<dynamic> messages;

  AddReviewModel.formJson(Map<String,dynamic> json){
    hasError = json['hasError'];
    errors = json['errors'];
    messages = json['messages'];

  }

}