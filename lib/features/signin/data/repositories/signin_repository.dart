abstract class SigninRepository {
  Future<bool> signin();
  Future<String?> isSignedIn();
  Future<bool> signout();
}