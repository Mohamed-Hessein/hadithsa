import 'package:dartz/dartz.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/api.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/book_hatdih.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/hadith.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/repo/homerepo.dart';
import 'package:wazker/Featured/utils/Error/filer.dart';

class Homeeimplment implements Homerepo {
  final Api api;

  Homeeimplment({required this.api});

  @override
  Future<Either<Filer, List<Hadith>>> fetchHadith() async {
    try {
      // api.get returns List<Hadith>
      final hadiths = await api.get(endpoint: 'ara-bukhari.json');
      return Right(hadiths);
    } catch (e) {
      return Left(Filureservise(e.toString()));
    }
  }

  @override
  Future<Either<Filer, List<BookHatdih>>> fetchBookNames() async {
    try {
      final booksJson = await api
          .getBookNames(); // Should return List<Map<String, dynamic>>
      final books = booksJson
          .map((e) => BookHatdih.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(books);
    } catch (e) {
      return Left(Filureservise(e.toString()));
    }
  }
}
