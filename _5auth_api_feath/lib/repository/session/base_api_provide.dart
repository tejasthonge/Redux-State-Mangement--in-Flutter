import 'package:_5auth_api_feath/common/http.dart';
import 'package:dio/dio.dart';

//here we created the base api provider class by using of that class we can callin all api requst
class BaseApiProvide {
//till now we requre only the get
//so we write the get method and supos we
  Future<Map<String, dynamic>> get(url, {queryParameters}) async {
    try {
      // here we claling the dio instance on http class thate we are write in the common follder 
      //when we creting the object of the http class it will returning the singletone instance 
      //means only one object all over project we crate the object of http then only the only on object is creted so the value of the
      //used in all over the project and we can use it in the app so all the time what was the variavble are present in that class it wass same valuse
      final response = await Http().dio.get(url,
          queryParameters: queryParameters,
          options: Options(contentType: Headers.jsonContentType));
      return response.data;
      
    } on DioException {
      // if any error occur then we catch it and print error message
      rethrow;
    }
  }
}
