import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/what_app/common/helper/show_alert_dialog.dart';
import 'package:flutter_starter/what_app/common/helper/show_loading_dialog.dart';
import 'package:flutter_starter/what_app/common/models/user_model.dart';
import 'package:flutter_starter/what_app/common/repository/firebase_storage_repository.dart';
import 'package:flutter_starter/what_app/common/routes/routes.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
});

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({required this.auth, required this.firestore});

  get currentUser {
    return firestore.collection('users').doc(auth.currentUser?.uid);
  }

  Future<UserModel?> getCurrentUserInfo() async {
    UserModel? user;
    final userInfo = await currentUser.get();
    if(userInfo.data() == null) return user;
    user = UserModel.fromMap(userInfo.data()!);
    return user;
  }

  void saveUserInfoToFireStore({
    required String username,
    required var profileImage,
    required ProviderRef ref,
    required BuildContext context,
    required bool mounted,
  }) async {
    try {
      showLoadingDialog(context: context, message: 'Saving user info ...');
      String uid = auth.currentUser!.uid;
      String profileImageUrl = '';
      profileImageUrl =
          await ref.read(firebaseStorageRepositoryProvider).storeFileToFirebase('profileImage/$uid', profileImage);

      UserModel user = UserModel(
        username: username,
        uid: uid,
        profileImageUrl: profileImageUrl,
        active: true,
        lastSeen: DateTime.april,
        phoneNumber: auth.currentUser!.phoneNumber!,
        groupId: [],
      );
      await currentUser.set(user.toMap());

      if (!mounted) return;
      Routes.push(context, Routes.home);
    } catch (e) {
      showAlertDialog(context: context, message: e.toString());
    }
  }

  void verifySmsCode({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) async {
    try {
      showLoadingDialog(context: context, message: 'verifySmsCode ...');
      final credential = PhoneAuthProvider.credential(
        verificationId: smsCodeId,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(credential);
      if (!mounted) return;
      Routes.push(context, Routes.userInfo);
    } on FirebaseAuthException catch (e) {
      Routes.pop(context);
      showAlertDialog(context: context, message: e.toString());
    }
  }

  void sendSmsCode({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      showLoadingDialog(context: context, message: 'Sending a code to $phoneNumber');
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!
          // Sign the user in (or link) with the auto-generated credential
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          showAlertDialog(context: context, message: e.toString());
        },
        codeSent: (smsCodeId, resendSmsCodeId) {
          Routes.push(
            context,
            Routes.verification,
            predicate: (context) => true,
            arguments: {
              'phoneNumber': phoneNumber,
              'smsCodeId': smsCodeId,
            },
          );
        },
        codeAutoRetrievalTimeout: (String smsCodeId) {},
      );
    } on FirebaseAuth catch (e) {
      Routes.pop(context);
      showAlertDialog(context: context, message: e.toString());
    }
  }
}
