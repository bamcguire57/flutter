import '../utils/network_util.dart';
import '../models/user.dart';

class RestData{
  NetworkUtil _netUtil = new NetworkUtil();
  static const BASE_URL = "";
  static const LOGIN_URL = BASE_URL + "/";

  Future<User> login(String username, String password) {
    return new Future.value(new User(username,password));
  }
}