import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
class Facebook{

 static Future<FacebookUser?> signInWithFacebook() async {

    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

     FacebookUser? facebookUser;

    if(loginResult.status == LoginStatus.success){

      final user = await FacebookAuth.instance.getUserData();
       facebookUser = FacebookUser.fromJson(user);

    }



  //  Create a credential from the access token
   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);



   var user = FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    // Once signed in, return the UserCredential
    return facebookUser;
  }

 static Future signOutFacebook() async {
  FacebookAuth.instance.logOut();

 }

}



class FacebookUser {

  String? name;
  String? email;
  String? id;
  String? profilePic;

  FacebookUser.fromJson(Map<String,dynamic> json){

    name = json['name'];
    email = json['email'];
    id = json['id'];
    profilePic = json['picture']['data']['url'];

  }




}


