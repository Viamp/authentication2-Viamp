import 'package:f_authentication_template/data/repositories/local_preferences.dart';

class Authentication {
  final _sharedPreferences = LocalPreferences();

  Future<bool> get init async =>
      await _sharedPreferences.retrieveData<bool>('logged') ?? false;

  Future<bool> login(user, password) async {
    await _sharedPreferences.storeData<bool>('logged', true);
    return Future.value(true);
  }

  void logout() async {
    await _sharedPreferences.storeData<bool>('logged', false);
  }
}
