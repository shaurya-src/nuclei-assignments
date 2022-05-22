import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_service/contacts_service.dart';
import 'dart:developer';

import '../view_model/contacts_provider.dart';
import 'contact_item.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsProvider>(builder: (context, provider, child) {
      ScrollController _controller = ScrollController();
      provider.getPermission();

      // Return list of all contacts
      return ListView(
        controller: _controller,
        shrinkWrap: true,
        children: provider.contactList
            .map(
              (contact) => GestureDetector(
                child: ContactItem(contact),
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
