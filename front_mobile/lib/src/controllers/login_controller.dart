import 'package:front_mobile/src/repositories/login_repository.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  bool validUser = false;
  @observable
  String name = '';
  @observable
  String password = '';

  @action
  tryLogin() async {
    await login(name, password);
  }

  @action
  setName({String newName}) => name = newName;
  @action
  setPassword({String newPassword}) => password = newPassword;
}
