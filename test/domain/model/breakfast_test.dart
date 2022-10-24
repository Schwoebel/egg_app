import 'dart:convert';
import 'dart:io';

import 'package:egg_app/domain/model/breakfast.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("Can create", (){
    Breakfast breakfast = Breakfast();
    expect(breakfast, isNotNull);
  });

  test("Can come from Json", (){
  final fileString = File('test_resources/breakfast.json').readAsStringSync();
  Breakfast breakfast = Breakfast.fromJson(jsonDecode(fileString));
  print(breakfast);
  });
}