import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wazker/Featured/Persintion/Home/data/cubit/fetchapicubit/fetchapistate.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/repo/homerepo.dart';

class Fetchapicubit extends Cubit<Fetchapistate> {
  Fetchapicubit(this.homerepo) : super(Fetchapistateintial());
  final Homerepo homerepo;
  Future<void> detx() async {
    emit(fetchapistateloading());
    var result = await homerepo.fetchHadith();

    result.fold(
      (failure) => emit(FetchapistateError(failure.errMessage)),
      (hadith) => emit(FetchapistateSucess(hadith)),
    );
  }
}
