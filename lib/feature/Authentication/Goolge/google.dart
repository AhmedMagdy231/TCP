import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Google {

  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();


    if(googleUser == null){
      return googleUser;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;


    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );


    var user = await FirebaseAuth.instance.signInWithCredential(credential);
    return googleUser;
  }

  static Future signOutGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();

  }


}