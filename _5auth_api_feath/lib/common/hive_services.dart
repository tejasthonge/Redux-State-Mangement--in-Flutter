

import 'package:_5auth_api_feath/models/Enployee_model.dart';
import 'package:_5auth_api_feath/models/auth_model.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
class HiveServices{
  //herw we create the private instance that returns allwas when object is created of this class

  static HiveServices _singleton = HiveServices._internal();
  factory HiveServices()=>_singleton;
  HiveServices._internal();
  //now we are write  the Boxes 

  Box<UserModel>? authBox;
  Box<EmployeeModel> ? employeeBox;

  Future<void > initialize()async{
    await Hive.initFlutter(); //by using this we can get the path of the user to store the hive instance locally 
    Hive.registerAdapter(UserModelAdapter());
    Hive.openBox<UserModel>(
      'auth_box'
    ).then(
      (Box<UserModel> box)=>authBox =box
    );
  }


  void saveAuthData(UserModel userData){
    authBox!.put('auth',userData);
  }

  UserModel? getAuthData(){
   
   try{
    UserModel? user=  authBox!.get('auth'); 
    return user;
   }
   catch(e){
    rethrow;

   }
  }

  clearAllLocalData(){
    authBox?.clear();
    employeeBox?.clear();
  }

  clearAuthLocalData(){
    authBox?.clear();
  }

}
