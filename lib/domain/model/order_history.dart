import 'dart:convert';

import 'package:egg_app/domain/model/egg_type_enum.dart';

class OrderHistory{
  final String breakfastId;
  final bool completed;
  final List<String> eggs;
  OrderHistory(this.breakfastId, this.completed, this.eggs);
  Map<String, dynamic> toJson() => {
    "breakfast": breakfastId,
    "completed": completed,
    "eggs": eggs.map((e) => e).toList()
  };
  OrderHistory.fromJson(Map<String, dynamic> jsonMap)
    : breakfastId = jsonMap['breakfast'],
      completed = jsonMap['completed'],
      eggs = List<String>.from(jsonMap['eggs'].map((egg) => egg));


}