import 'package:egg_app/domain/model/egg_type_enum.dart';

class Egg {
  EggType eggType;
  Egg({this.eggType = EggType.softBoiled});
  get type => eggType;

  Map<String, String> toJson() => {'eggType': eggType.name};

  Egg.fromJson(Map<String, dynamic> jsonMap)
  : eggType = EggType.values.byName(jsonMap['eggType']);

  Egg.fromString(String eggType)
  : eggType = EggType.values.byName(eggType);
}
