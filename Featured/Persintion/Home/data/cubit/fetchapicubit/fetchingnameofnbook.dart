import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wazker/Featured/Persintion/Home/data/cubit/fetchapicubit/statesfecthstate.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/book_hatdih.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/repo/homerepo.dart';

class Fetchap22icubit extends Cubit<Fetcha22pistate> {
  Fetchap22icubit(super.initialState, this.homerepo);
  final Homerepo homerepo;
  Future<void> fetchBookNames() async {
    emit(fetchapistate22loading());
    final result = await homerepo.fetchBookNames();
    result.fold(
      (failure) => emit(Fetchapistate22Error(failure.errMessage)),
      (books) => emit(Fetchapistate22Sucess(books)),
    );
  }
}
