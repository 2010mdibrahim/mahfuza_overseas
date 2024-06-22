import '../repository/contact_repository.dart';

abstract class ContactUseCase {
  final ContactRepository contactRepository;

  ContactUseCase(this.contactRepository);
}
