import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/book_hatdih.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/hadith.dart';
import 'package:wazker/Featured/utils/Error/filer.dart';

import 'package:dartz/dartz.dart';

abstract class Homerepo {
  Future<Either<Filer, List<Hadith>>> fetchHadith();
  Future<Either<Filer, List<BookHatdih>>> fetchBookNames();
}
