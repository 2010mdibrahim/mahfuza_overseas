

import '../../../../core/source/model/api_response.dart';
import '../../data/model/contact_model.dart';
import '../../data/source/contact_service.dart';
import '../../ui/contact_controller/contact_controller.dart';

abstract class ContactRepository {
  final ContactService contactService;

  ContactRepository(this.contactService);

  Future<Response<ContactModel?>?> contactPass({required List<dynamic> contactList});
}
