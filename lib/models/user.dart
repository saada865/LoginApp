// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel {
//   //String id;
//   String email;
//   String name;
//   String time;

//   DocumentReference reference;

//   UserModel({this.name, this.email, this.time, this.reference});

//   factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
//     var doc2 = doc;
//     return UserModel(
//       name: doc2["name"],
//       email: doc["email"],
//       //time: doc["time"],
//       reference: doc.reference,
//     );
//   }
//   //doc.id is by me
//   getTime() {
//     //return this.time;
//   }

//   Map<String, dynamic> toMap() => {
//         'name': name ?? "N/A",
//         'email': email ?? 'N/A',
//         //'time': DateTime.now() .millisecondsSinceEpoch.toString(),
//         'gender': 'male',
//         'city': 'islamabad'
//       };

//   // Map<String,dynamic> toMapForTime()=>{
//   //   'time': DateTime.now() .millisecondsSinceEpoch.toString(),
//   // };

// }
