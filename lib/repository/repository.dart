import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user/model/status.dart';
import 'package:user/model/usermodel.dart';

class UserRepository {
  Future<Status> registerUser({UserModel userModel}) async {
    try {
      User response = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: userModel.email, password: userModel.password))
          .user;

      if (response.uid != null) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(response.uid)
            .set({
          'nickName': userModel.nickName,
          'dob': userModel.dob,
          'phoneNumber': userModel.phoneNumber,
          'email': userModel.email,
          'password': userModel.password,
        });
        await FirebaseAuth.instance.signOut();
        return Status(
            data: response, isSuccess: true, message: "Register Success");
      } else {
        return Status(
          data: null,
          isSuccess: false,
          message: "Register Failed",
        );
      }
    } catch (e) {
      return Status(data: null, isSuccess: false, message: e.message);
    }
  }

  Future<Status> loginUser({UserModel userModel}) async {
    try {
      User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      ))
          .user;

      if (user.uid != null) {
        return Status(message: "Success", data: user, isSuccess: true);
      } else {
        return Status(data: null, isSuccess: true, message: "Could not Login");
      }
    } catch (e) {
      return Status(data: null, isSuccess: false, message: e.message);
    }
  }
}
