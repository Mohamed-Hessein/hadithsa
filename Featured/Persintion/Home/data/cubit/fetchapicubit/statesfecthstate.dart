import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/book_hatdih.dart';

class Fetcha22pistate {}

class Fetchapistate22intial extends Fetcha22pistate {}

class fetchapistate22loading extends Fetcha22pistate {}

class Fetchapistate22Sucess extends Fetcha22pistate {
  final List<BookHatdih> nameing;

  Fetchapistate22Sucess(this.nameing);
}

class Fetchapistate22Error extends Fetcha22pistate {
  final String errMessage;

  Fetchapistate22Error(this.errMessage);
}
