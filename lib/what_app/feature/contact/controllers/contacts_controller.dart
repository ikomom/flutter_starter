import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/what_app/feature/contact/repository/contact_repository.dart';

final contactControllerProvider = FutureProvider((ref) {
  final contactRepository = ref.watch(contactsRepositoryProvider);
  return contactRepository.getAllContacts();
});