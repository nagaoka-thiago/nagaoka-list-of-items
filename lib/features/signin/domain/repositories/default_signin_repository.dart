

import 'package:flutter_modular/flutter_modular.dart';

import '../../data/data_sources/signin_data_source.dart';
import '../../data/repositories/signin_repository.dart';

class DefaultSigninRepository implements SigninRepository {
  final _datasource = Modular.get<SigninDataSource>();
  @override
  Future<bool> signin() async{
    return await _datasource.signin();
  }
  
  @override
  Future<String?> isSignedIn() async{
    return await _datasource.isSignedIn();
  }
  
  @override
  Future<bool> signout() async{
    return _datasource.signout();
  }

}