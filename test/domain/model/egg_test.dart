import 'package:eggp_app/domain/model/egg.dart';
import 'package:eggp_app/domain/model/egg_type_enum.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("can be created",(){
    Egg egg = Egg();
    expect(egg, isInstanceOf<Egg>());
  });

  test("egg is softboild by default", (){
    Egg egg = Egg();
    expect(egg.type, equals(EggType.softBoiled));
  });

  test("egg can be set as hardboiled right away", (){
    Egg egg = Egg(eggType: EggType.hardBoiled);
    expect(egg.eggType, equals(EggType.hardBoiled));
  });
}

