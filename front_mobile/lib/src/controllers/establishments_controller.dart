import '../models/establishment_model.dart';
import '../repositories/establishments_repository.dart';
import 'package:mobx/mobx.dart';
part 'establishments_controller.g.dart';

class EstablishmentsController = _EstablishmentsControllerBase
    with _$EstablishmentsController;

abstract class _EstablishmentsControllerBase with Store {
  @observable
  List<Establishment> all = [];

  @action
  getList() async {
    final response = await getEstablishments();
    all = [...response];
    print(all);
  }
}
