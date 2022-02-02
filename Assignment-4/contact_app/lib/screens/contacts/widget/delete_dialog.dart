import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

Future<void> showDeleteDialog(BuildContext context, Contact contactInfo) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
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
          TextButton(
            child: Text(
              'Confirm',
              style: _alertText(FontWeight.w600),
            ),
            onPressed: () async {
              await ContactsService.deleteContact(contactInfo);
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'Cancel',
              style: _alertText(FontWeight.w600),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
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
