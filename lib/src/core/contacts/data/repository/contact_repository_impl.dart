import '../../../../core/source/model/api_response.dart';
import '../../domain/repository/contact_repository.dart';
import '../../ui/contact_controller/contact_controller.dart';
import '../model/contact_model.dart';
import '../source/contact_service.dart';

class ContactRepositoryImpl extends ContactRepository {
  ContactRepositoryImpl(ContactService contactService) : super(contactService);

  @override
  Future<Response<ContactModel?>?> contactPass({required List<dynamic> contactList})async{
    Response<ContactModel?>? apiResponse;
    apiResponse = await contactService.contactPass(contactList: contactList);
    return apiResponse;
  }

  // @override
  // Future<Response<List<ContactClass>?>?> contactPass({required List<ContactClass> contactsList}) async {
  //   Response<List<ContactClass>?>? apiResponse;
  //   apiResponse = await contactService.contactPass();
  //   return apiResponse;
  // }
}
