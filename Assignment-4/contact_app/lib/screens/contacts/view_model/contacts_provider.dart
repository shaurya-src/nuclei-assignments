import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsProvider extends ChangeNotifier {
  List<Contact> _contactList = [];
  bool _isContactLoaded = false;

  // Initial method to get permission
  void getPermission() async {
    if (await Permission.contacts.request().isGranted && !_isContactLoaded) {
      getAllContacts();
      notifyListeners();
    }
  }

  // Method to get list of all contacts
  void getAllContacts() async {
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    _contactList = _contacts;
    _isContactLoaded = true;
    notifyListeners();
  }

  // Method to delete contact
  void deleteContact(Contact contactInfo) async {
    await ContactsService.deleteContact(contactInfo);
    getAllContacts();
    notifyListeners();
  }

  // Search Contacts
  void searchContacts(String queryString) async {
    List<Contact> _searchedContacts = await ContactsService.getContacts(query: queryString);
    _contactList = _searchedContacts;
    notifyListeners();
  }

  // Getter for contactList and status
  List<Contact> get contactList => _contactList;
  bool get isContactLoaded => _isContactLoaded;
}
