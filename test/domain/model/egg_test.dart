import 'dart:convert';
import 'dart:io';

import 'package:egg_app/domain/model/egg.dart';
import 'package:egg_app/domain/model/egg_type_enum.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  Egg? egg;
  setUp((){
    egg = Egg();
  });
  test("can be created",(){
    expect(egg, isInstanceOf<Egg>());
  });

  test("egg is softboiled by default", (){
    expect(egg?.type, equals(EggType.softBoiled));
  });

  test("egg can be set as hardboiled right away", (){
    Egg egg = Egg(eggType: EggType.hardBoiled);
    expect(egg.eggType, equals(EggType.hardBoiled));
  });

  test("can be turned into json", (){
    final fileString = File('test_resources/egg.json').readAsStringSync();
    expect(jsonEncode(egg?.toJson()), equals(fileString));
  });

  test("can be created from json", (){
    final fileString = File('test_resources/egg.json').readAsStringSync();
    Egg jsonMadeEgg = Egg.fromJson(jsonDecode(fileString));
    expect(jsonMadeEgg.eggType, egg?.eggType);
  });
}

