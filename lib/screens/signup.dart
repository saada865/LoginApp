import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/authController.dart';
import '../screens/login.dart';
import '../ColorConstantsFolder/colors.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: ColorConstants.kPrimaryColor,
            appBar: AppBar(
              title: Text('Sign Up'),
            ),
            body: Center(
                child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Email'),
                    onChanged: (value) {
                      controller.emailController.text = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Password'),
                    obscureText: true,
                    onChanged: (value) {
                      controller.passwordController.text = value;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      //I put nameController
                      onPressed: () {
                        controller.createUser();
                      },
                      child: Text('Sign Up')),
                  TextButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(1.5)),
                      child: Text('Login'),
                      onPressed: () {
                        Get.offAll(() => (Login()));
                      })
                ],
              ),
            )),
          );
        });
  }
}
