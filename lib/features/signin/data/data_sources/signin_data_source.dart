abstract class SigninDataSource {
  Future<bool> signin();
  Future<String?> isSignedIn();
  Future<bool> signout();
}