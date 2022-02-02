import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:provider/provider.dart';

import '../view_model/contacts_provider.dart';

Future<void> showDeleteDialog(BuildContext context, Contact contactInfo) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Delete Confirmation',
          style: _alertText(FontWeight.w700),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Do you really want to delete this contact: ${contactInfo.displayName} ?',
                style: _alertText(),
              ),
            ],
          ),
        ),
        actions: [
          _getConfirmButton(context, contactInfo),
          _getCancelButton(context),
        ],
      );
    },
  );
}

Widget _getConfirmButton(BuildContext context, Contact contactInfo) {
  return Consumer<ContactsProvider>(
    builder: (context, provider, child) {
      return TextButton(
        child: Text(
          'Confirm',
          style: _alertText(FontWeight.w600),
        ),
        onPressed: () async {
          Navigator.of(context).pop();
          provider.deleteContact(contactInfo);
        },
      );
    },
  );
}

Widget _getCancelButton(BuildContext context) {
  return TextButton(
    child: Text(
      'Cancel',
      style: _alertText(FontWeight.w600),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}

TextStyle _alertText([FontWeight fontWeight = FontWeight.w300]) {
  const String _fontFamily = 'Raleway';
  return TextStyle(
    fontFamily: _fontFamily,
    fontWeight: fontWeight,
  );
}
