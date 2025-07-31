import 'package:equatable/equatable.dart';

import 'reference.dart';

class Grade {
  final String? grade;
  Grade({this.grade});
  factory Grade.fromJson(Map<String, dynamic> json) =>
      Grade(grade: json['grade'] as String?);
}

class Hadith extends Equatable {
  final dynamic hadithnumber;
  final dynamic arabicnumber;
  final String? text;
  final List<Grade>? grades;
  final Reference? reference;
  List<Hadith> haithop = [];
  Hadith({
    this.hadithnumber,
    this.arabicnumber,
    this.text,
    this.grades,
    this.reference,
  });

  factory Hadith.fromJson(Map<String, dynamic> json) {
    print(json); // Debug: See what data is coming in
    return Hadith(
      hadithnumber: json['hadithnumber'],
      arabicnumber: json['arabicnumber'],
      text: json['text'] as String,
      grades: (json['grades'] as List<dynamic>?)
          ?.map((e) => Grade.fromJson(e as Map<String, dynamic>))
          .toList(),
      reference: json['reference'] == null
          ? null
          : Reference.fromJson(json['reference'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'hadithnumber': hadithnumber,
    'arabicnumber': arabicnumber,
    'text': text,
    'grades': grades,
    'reference': reference?.toJson(),
  };

  @override
  List<Object?> get props {
    return [hadithnumber, arabicnumber, text, grades, reference];
  }
}
