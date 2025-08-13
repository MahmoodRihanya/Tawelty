import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';

class RegisterwithGoogle {
  static String? name;
  RegisterwithGoogle() {}
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    var box = Hive.box('authBox');
    await box.put('userUid', googleUser!.id);
    await box.put('isLoggedIn', true);
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    RegisterwithGoogle.name = googleUser!.displayName!;
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
