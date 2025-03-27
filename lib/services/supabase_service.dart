import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  Future<bool> googleSignIn() async {
    try {
      const webClientId = '505355264538-4k9r9kd3n48h8j10ev9dd0sp7mg2d556.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn = GoogleSignIn(serverClientId: webClientId);

      // 🔥 Force sign-out to prompt account selection every time
      await googleSignIn.signOut();

      // 🔄 Now sign in again (should show account picker)
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        print('Google Sign-In was canceled.');
        return false;
      }

      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;
      final accessToken = googleAuth.accessToken;

      if (idToken == null || accessToken == null) {
        print('Authentication failed: Missing ID or Access Token.');
        return false;
      }

      await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      print('Google Sign-In successful.');
      return true;
    } catch (error) {
      print('Google Sign-In Error: $error');
      return false;
    }
  }
}
