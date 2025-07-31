import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/1.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/book_hatdih.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/hadith.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/metadata.dart';

class Api {
  final baseurl =
      'https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions/';

  List<Hadith> hadithsList1 = [];
  Dio dio;
  Api(this.dio);

  Future<List<Hadith>> get({required String endpoint}) async {
    final url = '$baseurl$endpoint';
    var response = await dio.get(url);
    print(response.data);
    final data = response.data is String
        ? jsonDecode(response.data)
        : response.data;
    final List<dynamic> hadithliat = data["hadiths"] as List<dynamic>;
    final hadiths = hadithliat.map((e) => Hadith.fromJson(e)).toList();
    final metadata = Metadata.fromJson(data["metadata"]);
    hadithsList1 = hadiths;
    return hadiths;
  }

  Future<List<Map<String, dynamic>>> getBookNames() async {
    final url =
        'https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions.json';

    try {
      final response = await dio.get(url);

      print('📥 RAW DATA: ${response.data}'); // <-- اطبع البيانات الأول

      if (response.data is! Map<String, dynamic>) {
        throw Exception(
          '❌ Unexpected data format: ${response.data.runtimeType}',
        );
      }

      final data = response.data as Map<String, dynamic>;
      final List<Map<String, dynamic>> books = [];

      data.forEach((key, value) {
        print('🔹 Processing key: $key -> $value'); // Debug

        if (value is Map<String, dynamic>) {
          final name = value['name'] ?? 'بدون اسم';
          final collections = value['collection'];

          if (collections is List) {
            for (var c in collections) {
              books.add({
                'bookKey': key,
                'name': name,
                'link': c['link'] ?? '',
              });
            }
          } else {
            print('⚠️ collection ليس List في $key');
          }
        } else {
          print('⚠️ القيمة ليست Map في $key');
        }
      });

      print('✅ Final Books: $books');
      return books;
    } catch (e) {
      print('🔥 ERROR: $e');
      return [];
    }
  }
}
