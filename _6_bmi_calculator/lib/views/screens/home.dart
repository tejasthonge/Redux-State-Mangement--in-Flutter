import 'dart:developer';

import 'package:_6_bmi_calculator/redux/app/state.dart';
import 'package:_6_bmi_calculator/redux/bmi/action.dart';
import 'package:_6_bmi_calculator/redux/bmi/state.dart';
import 'package:_6_bmi_calculator/redux/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _weithtTEC = TextEditingController();

  final TextEditingController _heightFeetTEC = TextEditingController();

  final TextEditingController _heightInchTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late ViewModel viewModel;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red.shade900,
      //   title: Text("BMI Calculator"),
      // ),

      body: StoreConnector<AppState, ViewModel>(
          converter: (store) => ViewModel.fromStore(store, context),
          builder: (context, vm) {
            viewModel = vm;
            return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 700) {
                return Center(
                  child: OverflowBar(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 40),
                        width: 500,
                        // height: 500,
                        decoration: BoxDecoration(
                            color: Colors.amber.shade900,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow:const  [
                              BoxShadow(
                                  color:  Color.fromARGB(211, 0, 187, 212),
                                  // offset: Offset(10, 10),
                                  blurRadius: 20,
                                  spreadRadius: 20)
                            ]),
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: _weithtTEC,
                                  decoration: InputDecoration(
                                      hintText: "Enter Weight in KGs"),
                                  keyboardType: TextInputType.number,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Weight in KGs";
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _heightFeetTEC,
                                  decoration: InputDecoration(
                                      hintText: "Enter Height in Feet"),
                                  keyboardType: TextInputType.number,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Height in Feet";
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: _heightInchTEC,
                                  decoration: InputDecoration(
                                      hintText: "Enter Remaing Heighr in Inch"),
                                  keyboardType: TextInputType.number,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Height in Inch";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                    style:const  ButtonStyle(
                                        fixedSize: WidgetStatePropertyAll(
                                            Size(double.infinity, 50)),
                                        backgroundColor: WidgetStatePropertyAll(
                                            const Color.fromARGB(
                                                255, 241, 195, 117))),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {

                                        store.dispatch(
                                          calculateBMI(heightInFeet: double.parse(_heightFeetTEC.text.trim()), heightInInch: double.parse(_heightInchTEC.text.trim()), weight: double.parse(_weithtTEC.text.trim()))
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content:const  Text(
                                              "Fild Not be null",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            backgroundColor: Colors.amber.shade700,
                                            behavior: SnackBarBehavior.floating,
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text(
                                      "Calculate BMI",
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,width:30,),

                      vm.bmiState.allBMI !=null?
                      AnimatedContainer(
                        duration: Duration( seconds: 5),
                        width: 600,
                        height: 280,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: [
                            Text("All over BMI",
                            style: TextStyle( color: Colors.amber,
                            fontWeight:FontWeight.w600,fontSize: 18),
                            ),

                            Text(
                              viewModel.bmiState.allBMI.toString(),

                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 40,
                              ),
                            )
                          ],
                        ),
                      ):const SizedBox()
                    ],
                  ),
                );
              } else {
              return ListView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
                    // height: 300,
                    decoration: BoxDecoration(
                        color: Colors.indigo.shade400,
                        borderRadius: BorderRadius.circular(20)),

                    child: OverflowBar(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 40, horizontal: 20),
                          // width: 500,
                          // height: 500,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 143, 208, 236),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(211, 0, 187, 212),
                                    // offset: Offset(10, 10),
                                    blurRadius: 20,
                                    spreadRadius: 20)
                              ]),
                          child: Form(
                            key: _formKey,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    controller: _weithtTEC,
                                    decoration: InputDecoration(
                                        hintText: "Enter Weight in KGs"),
                                    keyboardType: TextInputType.number,
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter Weight in KGs";
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: _heightFeetTEC,
                                    decoration: InputDecoration(
                                        hintText: "Enter Height in Feet"),
                                    keyboardType: TextInputType.number,
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter Height in Feet";
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: _heightInchTEC,
                                    decoration: InputDecoration(
                                        hintText:
                                            "Enter Remaing Heighr in Inch"),
                                    keyboardType: TextInputType.number,
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter Height in Inch";
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                      style: const ButtonStyle(
                                          fixedSize: WidgetStatePropertyAll(
                                              Size(double.infinity, 50)),
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  const Color.fromARGB(
                                                      255, 241, 195, 117))),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {

                                          log("All Valuse are filed ");
                                          store.dispatch(calculateBMI(
                                              heightInFeet: double.parse(
                                                  _heightFeetTEC.text.trim()),
                                              heightInInch: double.parse(
                                                  _heightInchTEC.text.trim()),
                                              weight: double.parse(
                                                  _weithtTEC.text.trim())));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: const Text(
                                                "Fild Not be null",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              backgroundColor:
                                                  Colors.amber.shade700,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text(
                                        "Calculate BMI",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                          width: 30,
                        ),
                        vm.bmiState.allBMI != null
                            ? AnimatedContainer(
                                duration: Duration(seconds: 5),
                                width: 600,
                                // height: 280,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                  const Text(
                                      "All over BMI:",
                                      style: TextStyle(
                                          color: const Color.fromARGB(255, 255, 106, 7),
                                          fontWeight: FontWeight.w200,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      viewModel.bmiState.allBMI.toString(),
                                      style:const  TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                  )
                ],
              );
            }
                },
                );
          }),
    );
  }
}

class ViewModel {

  BMIState bmiState;

  ViewModel({required this.bmiState, });

  static ViewModel fromStore(Store<AppState> store, BuildContext context) {
    return ViewModel(

      bmiState: store.state.bmiState,
    );
  }
}
