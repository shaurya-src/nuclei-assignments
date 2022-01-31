import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(_maxHeight),
            child: _getAvatar(contactInfo),
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

  Widget _getAvatar(Contact contactInfo) {
    const double _svgSize = 50;
    const _path = 'assets/svg/';
    const _extension = '.svg';

    if (contactInfo.avatar!.isNotEmpty) {
      Uint8List _avatar = contactInfo.avatar!;
      return Image.memory(
        _avatar,
        fit: BoxFit.cover,
      );
    }

    return const Text("NA");
  }
}
