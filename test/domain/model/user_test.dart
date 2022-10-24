import 'dart:convert';
import 'dart:io';

import 'package:egg_app/domain/model/contact_details.dart';
import 'package:egg_app/domain/model/egg_type_enum.dart';
import 'package:egg_app/domain/model/order_history.dart';
import 'package:egg_app/domain/model/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("User", (){
    User? user;
    setUp((){
      ContactDetails contactDetails = ContactDetails("Curtis", "Schwoebel", "curtis.schwoebel@gmail.com","0735334287");
      contactDetails?.orderHistory = [OrderHistory("dfgert345", true, [EggType.softBoiled.toShortString(),EggType.hardBoiled.toShortString()])];
      user = User(contactDetails, "asdqwe123");
    });
    test("User can be created", (){
      expect(user, isInstanceOf<User>());
    });
    test("User Contact Details exist", (){
      expect(user?.getContactDetails(), isInstanceOf<ContactDetails>());
    });
    test("User Has An Id", (){
      expect(user?.getId(), equals("asdqwe123"));
    });
    test("User Has A token", (){
      user?.setToken("123qweasd");
      expect(user?.getToken(), equals("123qweasd"));
    });
    test("User has a pretty name", (){
      expect(user?.prettyContactName, equals("Curtis Schwoebel"));
    });
    test("can be turned into json", (){
      final fileString = File('test_resources/user.json').readAsStringSync();
      expect(jsonEncode(user?.toJson()), equals(fileString));
    });
    test("can be created from json", (){
      final fileString = File('test_resources/user.json').readAsStringSync();
      User jsonUser = User.fromJson(jsonDecode(fileString));
      expect(jsonUser.id, user?.id);
      expect(jsonUser.contactDetails.prettyName, equals("Curtis Schwoebel"));
    });
  });
}