import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_service/contacts_service.dart';
import 'dart:developer';

import '../../../app.dart';
import '../view_model/contacts_provider.dart';
import 'contact_item.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsProvider>(builder: (context, provider, child) {
      // Get permission and load all contacts
      provider.getPermission();

      // Return list of all contacts
      return ListView(
        shrinkWrap: true,
        children: provider.contactList
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

  // Navigate to ContactDetails page
  onContactTap(BuildContext context, Contact contact) {
    Navigator.pushNamed(context, contactDetailRoute, arguments: {'contact': contact});
  }
}
