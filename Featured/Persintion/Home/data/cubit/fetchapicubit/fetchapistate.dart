import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/hadith.dart';

class Fetchapistate {}

class Fetchapistateintial extends Fetchapistate {}

class fetchapistateloading extends Fetchapistate {}

class FetchapistateSucess extends Fetchapistate {
  final List<Hadith> hadith;

  FetchapistateSucess(this.hadith);
}

class FetchapistateError extends Fetchapistate {
  final String errMessage;

  FetchapistateError(this.errMessage);
}
