import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/what_app/common/models/user_model.dart';

final contactsRepositoryProvider = Provider((ref) {
  return ContactsRepository(firestore: FirebaseFirestore.instance);
});

class ContactsRepository {
  final FirebaseFirestore firestore;

  ContactsRepository({required this.firestore});

  Future<List<List<UserModel>>> getAllContacts() async {
    // contacts that are saved in the user's phone and hava a account
    List<UserModel> firebaseContacts = [];
    // contacts that are saved in the user's phone and not hava a account
    List<UserModel> phoneContacts = [];

    try {
      if (await FlutterContacts.requestPermission()) {
        final userCollection = await firestore.collection('users').get();
        final allContactsInThePhone = await FlutterContacts.getContacts(
          withProperties: true,
          withPhoto: true,
        );

        bool isContactFound = false;

        for (Contact contact in allContactsInThePhone) {
          // find firebase user phoneNumber is in the phone contact
          for (var firebaseContactData in userCollection.docs) {
            UserModel firebaseContact = UserModel.fromMap(firebaseContactData.data());

            if (contact.phones.isNotEmpty &&
               '+86${contact.phones[0].normalizedNumber}' == firebaseContact.phoneNumber) {
              firebaseContacts.add(firebaseContact);
              isContactFound = true;
              break;
            }
          }
          if (!isContactFound) {
            phoneContacts.add(
              UserModel(
                username: contact.displayName,
                uid: '',
                profileImageUrl: '',
                profileImage: contact.photo,
                active: false,
                lastSeen: DateTime.december,
                phoneNumber: contact.phones.isNotEmpty ? contact.phones[0].number : '',
                groupId: [],
              ),
            );
            isContactFound = false;
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }

    return [firebaseContacts, phoneContacts];
  }
}
