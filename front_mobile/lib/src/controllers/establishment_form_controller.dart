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
  bool newEstablishment = false;

  @action
  createNewEstablishment() {
    name = '';
    lat = '';
    lng = '';
    newEstablishment = true;
  }

  @action
  updateStablishment({Establishment newEstablishment}) {
    name = newEstablishment.name;
    lat = newEstablishment.lat.toString();
    lng = newEstablishment.lng.toString();
  }

  @action
  clear() {
    name = '';
    lat = '';
    lng = '';
    newEstablishment = false;
  }
}
