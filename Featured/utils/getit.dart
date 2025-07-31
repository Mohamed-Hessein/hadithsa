import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/api.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/repo/homeeimplment.dart';

final getit = GetIt.instance;
void setup() {
  // Fix: Api expects 2 positional arguments, so provide a dummy or real second argument as needed.
  getit.registerSingleton<Api>(Api((Dio())));
  getit.registerSingleton<Homeeimplment>(Homeeimplment(api: getit.get<Api>()));
  getit.registerSingleton<AuthHomerepo>(AuthHomerepo(getit.get<Api>()));
}

class AuthHomerepo {
  final Api api;

  AuthHomerepo(this.api);
}
