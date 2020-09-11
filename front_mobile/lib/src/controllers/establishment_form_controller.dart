import 'package:mobx/mobx.dart';
import '../models/establishment_model.dart';
part 'establishment_form_controller.g.dart';

class EstablishmentFormController = _EstablishmentFormControllerBase
    with _$EstablishmentFormController;

abstract class _EstablishmentFormControllerBase with Store {
  @observable
  String name;
  @observable
  String lat;
  @observable
  String lng;
  @observable
  int id;
  @observable
  bool isANewEstablishment = false;

  @action
  createNewEstablishment() {
    name = '';
    lat = '';
    lng = '';
    isANewEstablishment = true;
  }

  @action
  updateStablishment({Establishment newEstablishment}) {
    id = newEstablishment.id;
    name = newEstablishment.name;
    lat = newEstablishment.lat.toString();
    lng = newEstablishment.lng.toString();
    isANewEstablishment = false;
  }

  @action
  clear() {
    name = '';
    lat = '';
    lng = '';
    isANewEstablishment = false;
  }
}
