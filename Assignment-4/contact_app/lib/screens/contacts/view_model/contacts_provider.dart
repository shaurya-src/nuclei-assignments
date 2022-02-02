import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsProvider extends ChangeNotifier {
  List<Contact> _contactList = [];

  // Initial method to get permission
  void getPermission() async {
    if (await Permission.contacts.request().isGranted) {
      _getAllContacts();
    }
  }

  // Method to get list of all contacts
  void _getAllContacts() async {
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    _contactList = _contacts;
    notifyListeners();
  }

  // Getter for contact list
  List<Contact> get contactList => _contactList;
}
