import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactItem extends StatelessWidget {
  final Contact contactInfo;
  const ContactItem(this.contactInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _maxHeight = 70;
    const double _seperatorSpace = 15;
    const double _inPad = 10;
    String _imgPath = 'assets/images/Tommy.png';

    return Container(
      height: _maxHeight,
      padding: const EdgeInsets.only(bottom: _inPad, top: _inPad),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(_maxHeight),
            child: Image.asset(
              _imgPath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: _seperatorSpace,
          ),
          Text(
            contactInfo.displayName!,
            style: _nameStyle(),
          ),
        ],
      ),
    );
  }

  TextStyle _nameStyle() {
    return const TextStyle(
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );
  }
}
