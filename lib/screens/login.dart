import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../screens/signup.dart';
import '../controllers/authController.dart';
import '../ColorConstantsFolder/colors.dart';

class Login extends StatelessWidget {
  ColorConstants myColors = Get.put(ColorConstants());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: ColorConstants.kThirdSecondaryColor,
              appBar: AppBar(
                title: Text('Login'),
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Password'),
                        obscureText: true,
                        onChanged: (value) {
                          controller.passwordController.text = value;
                          //print(controller.passwordController.text);
                        },
                      ),
                      SizedBox(height: 30),
                      TextButton(
                          child: Text('Login'),
                          onPressed: () {
                            controller.login();
                          }),
                      TextButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(1.5)),
                        onPressed: () {
                          Get.offAll(() => SignUp());
                          //controller.update();
                        },
                        child: Text('Sign up'),
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
