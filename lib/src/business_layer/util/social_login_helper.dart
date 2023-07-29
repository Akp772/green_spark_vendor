import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/log_helper.dart';

class SocialLoginHelper{
  final _fb = FacebookLogin();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> loginWithFacebook() async {
    final res = await _fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    switch (res.status) {
      case FacebookLoginStatus.success:
         // Logged in
        // Get email (since we request email permission)
        final email = await _fb.getUserEmail();
        // But user can decline permission
        if (email != null) {
          LogHelper.logData('email is $email');
        }

        break;
      case FacebookLoginStatus.cancel:
        // User cancel log in
        break;
      case FacebookLoginStatus.error:
      // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }

  }

  Future<void> googleSignIn() async {
    try {
      GoogleSignInAccount? result =  await _googleSignIn.signIn();
      if(result != null){
        LogHelper.logData("result=>${result.email}");
      }
    } catch (error) {
      print(error);
    }
  }


}