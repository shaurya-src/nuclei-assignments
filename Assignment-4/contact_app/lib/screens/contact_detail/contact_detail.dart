import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactDetail extends StatelessWidget {
  final Contact contactItem;
  const ContactDetail(this.contactItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text('First Contact'),
        ],
      ),
    );
  }
}
