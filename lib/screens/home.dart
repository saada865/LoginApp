import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../controllers/authController.dart';
import 'package:intl/intl.dart';
import '../colorConstantsFolder/colors.dart';

class Home extends StatelessWidget {
  AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    _authController.getData2();

    // TODO: implement build
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Scaffold(
  //            backgroundColor: ColorConstants.kGravishBlueColor,
              appBar: AppBar(
                title: Text('Home'),
                actions: [
                  IconButton(
                    onPressed: () {
                      controller.signOut();
                    },
                    icon: Icon(Icons.logout_sharp),
                    tooltip: 'Log Out',
                  ),
                ],
              ),
              body: Center(
                child: Column(
                  children: [
                    Container(
                        //color: Colors.black,
                        child: (Card(
                      color: Colors.blueGrey,
                      child: Text(
                        'LogIn/SignIn History',
                        style: TextStyle(color: Colors.cyanAccent),
                      ),
                    ))),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.deepPurpleAccent, width: 2.5),
                            borderRadius: BorderRadius.circular(10.0)),
                        height: Get.height / 1.5,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (int i = 0; i < controller.myList.length; i++)
                                Container(
                                    child: Column(children: [
                                  Card(
                                      child: Row(children: [
                                    Text(controller.myList[i].toString())
                                    // controller.myList[i].toString(),
                                    // style: TextStyle(fontSize: 20),
                                  ])),
                                ]))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
        });
  }

  String returner(DateTime x) {
    return DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(
        DateTime.now().millisecondsSinceEpoch));
  }
}
