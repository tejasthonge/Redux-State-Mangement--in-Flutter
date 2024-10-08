import 'package:_5auth_api_feath/models/Enployee_model.dart';
import 'package:_5auth_api_feath/redux/app/app_state.dart';
import 'package:_5auth_api_feath/redux/auth/action.dart';
import 'package:_5auth_api_feath/redux/auth/state.dart';
import 'package:_5auth_api_feath/view/employee_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.fromStore(store),
        builder: (context, vm) {
          EmployeeModel userInfo = vm.authState.user!;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.amber.shade800,
              title: Text(
                "User Details page",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      userInfo.image,
                    ),
                  ),
                  Text(
                    "${userInfo.firstName} ${userInfo.lastName}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.amber.shade800,
                        fontWeight: FontWeight.bold),
                  ),
                  
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 118, 242, 122)),
                    child: Text(
                      userInfo.company.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 8),
                    ),
                  ),
                  Divider(),

                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(146, 216, 212, 212)
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userInfo.email,
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(userInfo.phone),
                                      Divider(),
                    
                        Text(userInfo.role),
                        Text("Company:" + "  " + userInfo.company.name),
                        Text("Role:" + " " + userInfo.role),
                        Text("University:" + " " + userInfo.university),
                        Divider(),

                        Text(
                          "Address:" +
                              " " +
                              userInfo.address.address +
                              "," +
                              userInfo.address.city,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(onPressed:  (){

              
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EmployyeListPage()));  
            },
              child: Icon(Icons.people),
            ),
          );
        });
  }
}

class _ViewModel {
  AuthState authState;
  _ViewModel(
    this.authState,
  );

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(store.state.authState);
  }
}
