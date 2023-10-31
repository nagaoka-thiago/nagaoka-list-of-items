import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/data_sources/signin_data_source.dart';

class DefaultSigninDataSource implements SigninDataSource{
  
  @override
  Future<bool> signin() async{
    bool res = false;
    
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuth = await googleSignInAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuth?.accessToken,
      idToken: googleSignInAuth?.idToken,
    );
    
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    User? user = userCredential.user;

    if(user != null) {
      res = true;
    }
    return res;
  }
  
  @override
  Future<String?> isSignedIn() async{
    return FirebaseAuth.instance.currentUser != null ? FirebaseAuth.instance.currentUser!.displayName : null;
  }
  
  @override
  Future<bool> signout() async{
    await FirebaseAuth.instance.signOut();
    return FirebaseAuth.instance.currentUser == null;
  }
}