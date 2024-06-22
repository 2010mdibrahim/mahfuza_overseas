
import '../../../../core/source/model/api_response.dart';
import '../../data/model/contact_model.dart';
import '../../ui/contact_controller/contact_controller.dart';
import 'contact_usecase.dart';

class ContactPassUseCase extends ContactUseCase {
  ContactPassUseCase(super.contactRepository);

  Future<Response<ContactModel?>?> call({required List<dynamic> contactsList}) async {
    var response = await contactRepository.contactPass(contactList: contactsList);
    return response;
  }
}
