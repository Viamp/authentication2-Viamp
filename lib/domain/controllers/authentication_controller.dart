import 'package:f_authentication_template/domain/use_case/authentication.dart';
import 'package:get/get.dart';
import 'user.dart';

class AuthenticationController extends GetxController {
  var _log = false.obs;
  var _uex = false.obs;

  bool get log => _log.value;
  bool get uex => _uex.value;
  set _setlog(bool mode) => _log.value = mode;
  set _setuex(bool mode) => _uex.value = mode;

  final Authentication _authentication = Get.find();

  final List<UserA> _people = [];

  void _initState() async {
    _setlog = await _authentication.init;
  }

  AuthenticationController() {
    _initState();
  }

  Future<bool> login(email, pass) async {
    for (var i = 0; i < _people.length; i++) {
      if (_people[i].email == email) {
        bool ans = await _authentication.login(email, pass);
        _setlog = true;
        _setuex = true;

        return Future.value(true);
      }
    }
    return Future.value(false);
  }

  Future<bool> createUser(email, pass) async {
    if (email != null || pass != null) {
      var _user = UserA(email);
      _people.add(_user);

      return Future.value(true);
    }

    return Future.value(false);
  }

  void logout() {
    _authentication.logout();
    _setlog = false;
  }
}
