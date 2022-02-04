import 'package:contacts_service/contacts_service.dart';
import 'package:hive/hive.dart';

part 'user_contact.g.dart';

@HiveType(typeId: 0)
class UserContact extends HiveObject {
  @HiveField(0)
  late Contact contact;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String phoneNumber;
}
