import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import './contact_item.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Contact> contactList = [];

  @override
  void initState() {
    super.initState();
    getPermissions();
  }

  getPermissions() async {
    if (await Permission.contacts.request().isGranted) {
      getAllContacts();
    }
  }

  getAllContacts() async {
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    setState(() {
      contactList = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.people_alt_rounded),
        title: const Text('Contacts'),
        centerTitle: true,
        backgroundColor: Colors.cyan[700],
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: ListView(
          children: [
            ...contactList.map((contact) => ContactItem(contact)),
          ],
        ),
      ),
    );
  }
}
