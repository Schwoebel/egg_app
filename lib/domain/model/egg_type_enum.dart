enum EggType{
  hardBoiled,
  softBoiled
}

extension ParseToString on EggType {
  String toShortString() {
    return toString().split('.').last;
  }
}