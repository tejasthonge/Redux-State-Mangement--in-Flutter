

import 'package:_5auth_api_feath/common/hive_services.dart';
import 'package:_5auth_api_feath/models/auth_model.dart';

class SessionAction { 
  @override
  String toString() => "$runtimeType";
}


class LoadSessionFromCache extends SessionAction {
  final UserModel? cached = HiveServices().getAuthData();
}




