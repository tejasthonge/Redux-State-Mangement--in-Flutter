
import 'dart:async';
import 'dart:developer';

import 'package:_5auth_api_feath/models/auth_model.dart';
import 'package:_5auth_api_feath/redux/app/app_state.dart';
import 'package:_5auth_api_feath/redux/app/store.dart';
import 'package:_5auth_api_feath/redux/auth/action.dart';
import 'package:_5auth_api_feath/redux/employee/action.dart';
import 'package:_5auth_api_feath/redux/loader/loader_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final user = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar( 
        backgroundColor: Colors.amber.shade100,
        centerTitle:true,
        // title:  const Text(
        //   "Please Login",
        //   style: TextStyle( 
        //     color: Colors.amber
        //   ),
        //   ),

        title: const Icon(Icons.widgets,color: Colors.white,),
      ),

      body: StoreConnector<AppState,_ViewModel>( converter:(store)=>_ViewModel.fromStore(context,store, UserModel(username: user.text.trim(),password: password.text.trim())),

        onInit: (store) async{
              Completer completer = Completer();
              store.dispatch(getEmployeeList(context, 1, completer));

        },
        

        builder: (context,vm){
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column( 
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              
              
                children: [ 
              
                  const SizedBox(height: 100,),
                  TextFormField( 
                    controller: user,
                    decoration: InputDecoration( 
              
                      hintText: "Username or email",
                      border: OutlineInputBorder()
                      
                    ),
                  ),
            
                  const SizedBox(height: 30,),
                  TextFormField( 
                    controller: password,
                    decoration: const InputDecoration( 
                      hintText: "Password",
                      border: OutlineInputBorder()
                    ),
                  ),
                  const SizedBox(height: 50,),
                  GestureDetector(
                    onTap: () {
                      vm.loginUser( UserModel(username:user.text.trim() , password: password.text.trim()));
                      if(password.text.trim().isNotEmpty && user.text.trim().isNotEmpty) {
                      }
                      else{ 
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the fields")));
                      }
                    },
                    child: Container( 
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.amber.shade800
                      ),
                      child:
                      store.state.loaderState.isLoading ?
                        Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ):
                       Text(

                        
                        "Login",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
         ),


         floatingActionButton: FloatingActionButton(
          onPressed: (){
            showModalBottomSheet(
              shape: BeveledRectangleBorder( 
                borderRadius: BorderRadius.circular(30)
              ),
              context: context, builder: (context){
              
              return Container(
                decoration: BoxDecoration( 
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)

                ),
                height: 400,
                child: Column(
                  children: [
                    Text("Login by Using Following username and passwords",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Positioned(
                      top: 20,
                      child: SizedBox(
                        height: 350,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: store.state.employeeState.employeeList!.length,
                          itemBuilder:(context ,index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: ListTile( 
                              // tileColor: Colors.amber.shade100,
                              title: Text("Username ${store.state.employeeState.employeeList![index].username}"),
                              subtitle: Text("Password :${store.state.employeeState.employeeList![index].password}"),
                              
                            ),
                          );
                        } ),
                      ),
                    ),
                  ],
                ),
              );

            });

         },
          child: Icon(Icons.list),
         ),
    );
  }
}


class _ViewModel{ 

  final LoaderState loaderState;
  final Function( UserModel user) loginUser;
  _ViewModel({required this.loginUser,required this.loaderState});

 static  _ViewModel fromStore(BuildContext context ,Store<AppState> store,UserModel user) {

  // final authState = store.state.authState;

  _loginUser(UserModel user){

    store.dispatch(checkUserPresentInDb(context: context, user: user, empList: store.state.employeeState.employeeList!));
  }
  return _ViewModel(
  loginUser: _loginUser,
  loaderState: store.state.loaderState
 ) ;
 }
}