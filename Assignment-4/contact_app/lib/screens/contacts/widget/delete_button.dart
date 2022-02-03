import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class DeleteButton extends StatelessWidget {
  final Contact contactInfo;
  const DeleteButton(this.contactInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete_forever_rounded),
      onPressed: () => _showDeleteDialog(context),
    );
  }

  Future<void> _showDeleteDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Cofirm Contact Deletion"),
          content: Text(
            "Do you really want to delete this contact: ${contactInfo.displayName}? ",
          ),
          actions: [
            _getConfirmButton(context),
            _getCancelButton(context),
          ],
        );
      },
    );
  }

  Widget _getConfirmButton(BuildContext context) {
    return TextButton(
      child: const Text("Confirm"),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  Widget _getCancelButton(BuildContext context) {
    return TextButton(
      child: const Text("Cancel"),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
