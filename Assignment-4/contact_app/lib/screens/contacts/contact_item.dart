import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'delete_dialog.dart';

class ContactItem extends StatelessWidget {
  final Contact contactInfo;
  const ContactItem(this.contactInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _maxHeight = 70;
    const double _seperatorSpace = 15;
    const double _inPad = 10;

    return Container(
      height: _maxHeight,
      padding: const EdgeInsets.only(bottom: _inPad, top: _inPad),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: _seperatorSpace,
          ),
          getAvatar(contactInfo),
          const SizedBox(
            width: _seperatorSpace,
          ),
          SizedBox(
            height: _maxHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contactInfo.displayName!,
                  style: _nameStyle(),
                ),
                Text(
                  contactInfo.phones![0].value!,
                  style: _phoneStyle(),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.delete_forever_rounded),
            onPressed: () {
              showDeleteDialog(context, contactInfo);
            },
          )
        ],
      ),
    );
  }

  TextStyle _nameStyle() {
    return const TextStyle(
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: 1.2,
    );
  }

  TextStyle _phoneStyle() {
    return const TextStyle(
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w300,
      fontSize: 14,
      letterSpacing: 1.5,
    );
  }

  static Widget getAvatar(Contact contactInfo, {double imgSize = 40}) {
    return Container(
      width: imgSize,
      height: imgSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: (contactInfo.avatar!.isNotEmpty)
          ? CircleAvatar(
              backgroundImage: MemoryImage(contactInfo.avatar!),
            )
          : CircleAvatar(
              child: Text(
                contactInfo.initials(),
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ),
    );
  }
}
