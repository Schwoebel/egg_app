import 'package:egg_app/domain/model/egg_type_enum.dart';

class Egg {
  EggType eggType;
  Egg({this.eggType= EggType.softBoiled});
  get type => eggType;

  Map<String, String> toJson(){
    return <String, String>{
      'eggType': eggType.toString()
    };
  }
}