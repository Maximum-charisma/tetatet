// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:tetatet/services/network.dart';

// loginAno(User? user) async {
//     UserCredential userCredential =
//         await FirebaseAuth.instance.signInAnonymously();
//     user = userCredential.user!;
//     Network.addUser(userCredential.user!.uid, DateTime.now().toString());
//   }