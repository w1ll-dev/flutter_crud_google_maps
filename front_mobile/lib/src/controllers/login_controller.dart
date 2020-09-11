import 'package:front_mobile/src/repositories/login_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  dynamic validUser = false;
  @observable
  String name = '';
  @observable
  String password = '';

  addStringToSF(String authToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', authToken);
  }

  @action
  tryLogin() async {
    Map<String, dynamic> response = await login(name, password);
    if (response['auth']) {
      await addStringToSF(response['token']);
      validUser = true;
      print({'validUser': validUser, 'token': response['token']});
    } else {
      validUser = false;
    }
  }

  @action
  setName({String newName}) => name = newName;
  @action
  setPassword({String newPassword}) => password = newPassword;

  @action
  reset() {
    validUser = false;
    name = '';
    password = '';
  }
}
