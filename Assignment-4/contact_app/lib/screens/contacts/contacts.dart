import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../app.dart';
import 'view_model/contacts_provider.dart';
import 'widget/contact_item.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Contact> contactList = [];
  TextEditingController searchController = TextEditingController();

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

  searchContacts() async {
    String _query = "";
    List<Contact> _searchedContacts = await ContactsService.getContacts(query: _query);
    setState(() {
      contactList = _searchedContacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _getSearchWidget(),
            _getContactList(
              context,
            ),
          ],
        ),
      ),
    );
  }

  onContactTap(BuildContext context, Contact contact) {
    Navigator.pushNamed(context, contactDetailRoute, arguments: {'contact': contact});
  }

  PreferredSizeWidget? getAppBar() {
    return AppBar(
      leading: const Icon(Icons.people_alt_rounded),
      title: const Text('Contacts'),
      centerTitle: true,
      backgroundColor: Colors.cyan[700],
      actions: [
        IconButton(
          onPressed: () async {
            try {
              await ContactsService.openContactForm();
              getAllContacts();
            } on FormOperationException catch (e) {
              log("Error: ${e.toString()}");
            }
          },
          icon: const Icon(Icons.add_circle_outline_rounded),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _getSearchWidget() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
            labelText: 'Search',
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
            prefixIcon: Icon(Icons.search, color: Colors.cyan)),
      ),
    );
  }

  Widget _getContactList(BuildContext context) {
    return Consumer<ContactsProvider>(builder: (context, provider, child) {
      return ListView(
        shrinkWrap: true,
        children: contactList
            .map(
              (contact) => GestureDetector(
                child: ContactItem(contact),
                // onTap: () => onContactTap(context, contact),
                onTap: () async {
                  try {
                    await ContactsService.openExistingContact(contact);
                  } on FormOperationException catch (e) {
                    log(e.toString());
                  }
                },
              ),
            )
            .toList(),
      );
    });
  }
}
