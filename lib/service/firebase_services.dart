import 'dart:async';

import 'package:dice_game/app/constants.dart';
import 'package:dice_game/model/app_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseService extends GetxService {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  User? get currentUser => FirebaseAuth.instance.currentUser;

  Future<void> initService() async {
    await Firebase.initializeApp();
  }

  Future<UserCredential?> registerUser(
      {required String email, required String password}) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .timeout(timeoutDuration);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw 'Email is already used\nPlease check the email.';
      } else if (e.code == 'invalid-email') {
        throw 'Email is not valid.';
      } else if (e.code == 'operation-not-allowed') {
        throw 'Internal error\nPlease try again later.';
      } else if (e.code == 'weak-password') {
        throw 'Weak passsword\nPlease make the password more strong\n\nYou can special characters like @!#\$%^*()';
      }
    } on TimeoutException {
      throw 'Request timedout\nPlease try again.';
    } catch (e) {
      print(e);
      throw 'Error occured\nPlease try again later';
    }
    return null;
  }

  Future<UserCredential?> login(
      {required String email, required String password}) async {
    try {
      return await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw 'Email is not valid.';
      } else if (e.code == 'user-disabled') {
        throw 'User has been banned to use our services.';
      } else if (e.code == 'user-not-found') {
        throw 'User not found\nPlease register first.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong passsword\nPlease check the password';
      }
    } on TimeoutException {
      throw 'Request timedout\nPlease try again.';
    } catch (e) {
      print(e);
      throw 'Error occured\nPlease try again later';
    }
    return null;
  }

  Future<AppUser?> getUserFromCloud(String userId) async {
    QuerySnapshot<Map<String, dynamic>> queryData = await FirebaseFirestore
        .instance
        .collection('users')
        .where('user_id', isEqualTo: userId)
        .get();

    if (queryData.docs.isNotEmpty) {
      return AppUser.fromJson(queryData.docs.first.data());
    }

    return null;
  }

  Future<void> updateUserInCloud(AppUser user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.userId)
        .set(user.toJson());
  }
}
