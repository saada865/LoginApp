import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/screens/home.dart';
import 'package:login_app/screens/login.dart';
import 'package:intl/intl.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  var myList = [];
  int i = 0;
  bool checker = false;

  getUserData() async {
    DocumentSnapshot data = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    //user = UserModel.fromDocumentSnapshot(data);
    update();
  }

  void createUser() async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(_authResult.user.uid)
          .set({'email': _authResult.user.email, 'id': _authResult.user.uid});

      await FirebaseFirestore.instance
          .collection('users')
          .doc(_authResult.user.uid)
          .collection('Times')
          .add({
        'time': DateFormat.jm().add_yMd().format(
            DateTime.fromMillisecondsSinceEpoch(
                DateTime.now().millisecondsSinceEpoch))
      });

      Get.offAll(() => Home());
    } catch (e) {
      Get.snackbar('Error in Signing up MyCheck', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login() async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(_authResult.user.uid)
          .collection('Times')
          .add({
        "time": DateFormat.jm().add_yMd().format(
            DateTime.fromMillisecondsSinceEpoch(
                DateTime.now().millisecondsSinceEpoch))
      });

      Get.offAll(() => Home());
      //if (myList.length > 2) {

      //update();

    } catch (e) {
      Get.snackbar('Error logging in MyCheck', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      //clear();
      Get.offAll(() => Login());
    } catch (e) {
      Get.snackbar('Error signing out MyCheck', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<DocumentReference> addMessageToGuestBook() {
    return FirebaseFirestore.instance.collection('users').add(<String, dynamic>{
      'email': emailController,
      'id': _auth.currentUser.uid
    });
  }

  Future getDocs() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      print(a.id);
    }
  }

  void getData2() async {
    myList.clear();
    final firestoreInstance = FirebaseFirestore.instance;
    var qSnap = await firestoreInstance
        .collection('users')
        .doc(_auth.currentUser.uid)
        .collection('Times')
        .get();

    qSnap.docs.forEach((result) {
      myList.add(result['time']);
      //print(result.data());
      print(myList);
      update();
      //return;
    });
  }

  getData() {
    var firestoreDb =
        FirebaseFirestore.instance.collection("users").snapshots();
    return firestoreDb;
  }
}
