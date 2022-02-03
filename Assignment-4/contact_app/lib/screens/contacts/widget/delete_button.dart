import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:provider/provider.dart';

import '../view_model/contacts_provider.dart';

class DeleteButton extends StatelessWidget {
  final Contact contactInfo;
  const DeleteButton(this.contactInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsProvider>(
      builder: (context, provider, child) {
        return IconButton(
          icon: const Icon(Icons.delete_forever_rounded),
          onPressed: () => _showDeleteDialog(context, provider),
        );
      },
    );
  }

  Future<void> _showDeleteDialog(BuildContext context, ContactsProvider provider) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Cofirm Contact Deletion",
            style: _alertText(FontWeight.w700),
          ),
          content: Text(
            "Do you really want to delete this contact: ${contactInfo.displayName} ? ",
            style: _alertText(FontWeight.w300),
          ),
          actions: [
            _getConfirmButton(context, provider),
            _getCancelButton(context),
          ],
        );
      },
    );
  }

  Widget _getConfirmButton(BuildContext context, ContactsProvider provider) {
    return TextButton(
      child: Text(
        "Confirm",
        style: _alertText(FontWeight.w600),
      ),
      onPressed: () {
        provider.deleteContact(contactInfo);
        Navigator.of(context).pop();
      },
    );
  }

  Widget _getCancelButton(BuildContext context) {
    return TextButton(
      child: Text(
        "Cancel",
        style: _alertText(FontWeight.w600),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  TextStyle _alertText(FontWeight weight) {
    return TextStyle(
      fontFamily: 'Raleway',
      letterSpacing: 1.2,
      fontWeight: weight,
    );
  }
}
