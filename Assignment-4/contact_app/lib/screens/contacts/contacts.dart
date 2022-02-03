import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

import 'view_model/contacts_provider.dart';
import 'widget/contact_list.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Make SearchWidget Unscrollable
    return Scaffold(
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _getSearchWidget(),
            const ContactList(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget? getAppBar() {
    return AppBar(
      leading: const Icon(Icons.people_alt_rounded),
      title: const Text('Contacts'),
      centerTitle: true,
      backgroundColor: Colors.cyan[700],
      actions: [
        _getNewContactWidget(),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _getNewContactWidget() {
    return Consumer<ContactsProvider>(
      builder: (context, provider, child) {
        return IconButton(
          onPressed: () async {
            try {
              await ContactsService.openContactForm();
              provider.getAllContacts();
            } on FormOperationException catch (e) {
              log("Error: ${e.toString()}");
            }
          },
          icon: const Icon(Icons.add_circle_outline_rounded),
        );
      },
    );
  }

  Widget _getSearchWidget() {
    TextEditingController searchController = TextEditingController();
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
}
