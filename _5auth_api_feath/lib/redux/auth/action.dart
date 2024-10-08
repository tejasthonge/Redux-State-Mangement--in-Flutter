import 'dart:developer';

import 'package:_5auth_api_feath/models/Enployee_model.dart';
import 'package:_5auth_api_feath/models/auth_model.dart';
import 'package:_5auth_api_feath/redux/app/app_state.dart';
import 'package:_5auth_api_feath/redux/app/store.dart';
import 'package:_5auth_api_feath/redux/auth/state.dart';
import 'package:_5auth_api_feath/redux/loader/loader_action.dart';
import 'package:_5auth_api_feath/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

abstract class AuthAction {
  @override
  String toString() => "$AuthAction";
}

class LoginSuccess extends AuthAction {
  EmployeeModel userInfo;
  LoginSuccess(this.userInfo);
}

class LoginFailure extends AuthAction {
  String errorMessage;
  LoginFailure(this.errorMessage);
}

class Logout extends AuthAction {}

ThunkAction<AppState> checkUserPresentInDb(
    {required BuildContext context,
    required UserModel user,
    required List<EmployeeModel> empList}) {
  String? userName;
  String password;
  userName = user.username;

  password = user.password;

  return (Store<AppState> store) async {
    log(store.state.loaderState.isLoading.toString());

    log("cheaking the user is present in the database");
    store.dispatch(LoaderLodingStart());
    log(store.state.loaderState.isLoading.toString());
    for (int i = 0; i < empList.length; i++) {
      if (empList[i].username == userName && empList[i].password == password) {
        log("${empList[i].username}  ==  $userName");
        await Future.delayed(Duration(seconds: 1));
        log("user is present in the database");
        EmployeeModel userData = empList[i];
        store.dispatch(LoginSuccess(userData));
        // store.dispatch(LoaderLodingStart());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text("User ${empList[i].firstName} is preseet in Database")));
        store.dispatch(LoaderLodingFinish());
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_)=>const HomeScreen()),(route) => false,);
        log(store.state.loaderState.isLoading.toString());
        return;
      }
    }
    await Future.delayed(Duration(milliseconds: 500));

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User is not preseet in Database")));
    store.dispatch(LoaderLodingFinish());
    log(store.state.loaderState.isLoading.toString());

    return;
  };
}
