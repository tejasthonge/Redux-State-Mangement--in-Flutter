import 'package:_5auth_api_feath/redux/app/app_state.dart';
import 'package:redux/redux.dart';
import 'package:dio/dio.dart';

class Http{
  late Dio dio;
  late Store<AppState> store;
  final _options = BaseOptions();
  //by followin way we can use the singleton patten 
  static final Http _singleton = Http._internal();
  factory Http()=>_singleton;
  Http._internal();  //this is pravate namade construtor 

  void init(Store<AppState> store){
    this.store = store;  //when this init state is callindg we will intiolize the store value to the store
    dio = Dio(_options);  //here we also intilizing the dio also  
    
  }
}