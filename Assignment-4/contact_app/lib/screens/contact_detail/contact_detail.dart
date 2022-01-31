import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import '../contacts/contact_item.dart';

class ContactDetail extends StatelessWidget {
  final Contact contactItem;
  const ContactDetail(this.contactItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = contactItem.displayName!;
    String phone = contactItem.phones!.first.value!;
    String email = contactItem.emails!.first.value!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(' '),
        backgroundColor: Colors.cyan[700],
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          imageBanner(contactItem),
          infoBanner('Name', name, Icons.people_alt_rounded),
          infoBanner('Phone', phone, Icons.phone_android_rounded),
          infoBanner('E-Mail', email, Icons.email_rounded),
        ],
      ),
    );
  }

  Widget infoBanner(String title, String info, IconData icon) {
    const double _margin = 10;
    const double _padding = 15;
    return Container(
      margin: const EdgeInsets.all(_margin),
      padding: const EdgeInsets.all(_padding),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(
          color: Colors.cyan.shade700,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: _titleStyle(),
              ),
            ],
          ),
          Text(
            info,
            style: _infoStyle(),
          ),
        ],
      ),
    );
  }

  Widget imageBanner(Contact contactInfo) {
    return Container(
      constraints: const BoxConstraints.expand(
        height: 300,
      ),
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      child: ContactItem.getAvatar(contactInfo),
    );
  }

  TextStyle _infoStyle() {
    return const TextStyle(
      fontFamily: 'Raleway',
      fontSize: 16,
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle _titleStyle() {
    return const TextStyle(
      fontFamily: 'Raleway',
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
  }
}
