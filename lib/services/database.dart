// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:login_app/models/user.dart';

// class Database extends GetxController{
//    FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<bool> createNewUser(UserModel user)async {
//     try{
//       await _firestore.collection("users").doc(user.reference.id).set(user.toMap());
//       return true;
//     }
//     catch(e) {
//       print(e);
//       return false;
//     }
//   }

//   Future<UserModel> getUser(String uid) async {
//     try{
//       DocumentSnapshot doc = await _firestore.collection("users").doc(uid).get();
//       return UserModel.fromDocumentSnapshot(doc);
//     }
//     catch(e) {
//       print(e);
//       rethrow;
//     }
//   }
  // blabla(){
  //   List <UserModel> usersList = [];
  //  usersCollection.snapshots().listen((event) {
  //     event.docs.forEach((element) {
  //       usersList.add(UserModel.fromDocumentSnapshot(element));
  //     });
  //   });
  //}
//}