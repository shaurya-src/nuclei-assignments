import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class DeleteButton extends StatelessWidget {
  final Contact contactInfo;
  const DeleteButton(this.contactInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete_forever_rounded),
      onPressed: () => print("foobar"),
    );
  }
}
