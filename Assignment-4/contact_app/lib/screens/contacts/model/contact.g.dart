import 'package:contacts_service/contacts_service.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContactAdapter extends TypeAdapter<Contact> {
  @override
  final int typeId = 0;

  @override
  Contact read(BinaryReader reader) {
    return Contact()
      ..displayName = reader.read()
      ..givenName = reader.read()
      ..middleName = reader.read()
      ..prefix = reader.read()
      ..suffix = reader.read()
      ..familyName = reader.read()
      ..company = reader.read()
      ..jobTitle = reader.read()
      ..emails = reader.read()
      ..phones = reader.read()
      ..postalAddresses = reader.read()
      ..avatar = reader.read()
      ..birthday = reader.read()
      ..androidAccountType = reader.read()
      ..androidAccountTypeRaw = reader.read()
      ..androidAccountName = reader.read();
  }

  @override
  void write(BinaryWriter writer, Contact obj) {
    writer.write(obj.givenName);
    writer.write(obj.displayName);
    writer.write(obj.middleName);
    writer.write(obj.prefix);
    writer.write(obj.suffix);
    writer.write(obj.familyName);
    writer.write(obj.company);
    writer.write(obj.jobTitle);
    writer.write(obj.emails);
    writer.write(obj.phones);
    writer.write(obj.postalAddresses);
    writer.write(obj.avatar);
    writer.write(obj.birthday);
    writer.write(obj.androidAccountType);
    writer.write(obj.androidAccountTypeRaw);
    writer.write(obj.androidAccountName);
  }
}
