import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:egg_app/domain/model/contact_details.dart';
import 'package:egg_app/domain/model/egg_type_enum.dart';
import 'package:egg_app/domain/model/order_history.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("contact details", (){
    ContactDetails? contactDetails;
    setUp((){
      contactDetails = ContactDetails("Curtis", "Schwoebel", "curtis.schwoebel@gmail.com", "0735334287");
      contactDetails?.orderHistory = [OrderHistory("dfgert345", true, [EggType.softBoiled.toShortString(),EggType.hardBoiled.toShortString()])];
    });
    test("can be created", (){
      expect(contactDetails, isInstanceOf<ContactDetails>());
    });
    test("User has a first name", (){
      expect(contactDetails?.getFirstName(), equals("Curtis"));
    });
    test("User has a last name", (){
      expect(contactDetails?.getLastName(), equals("Schwoebel"));
    });
    test("User has an email address", (){
      expect(contactDetails?.getEmailAddress(), equals("curtis.schwoebel@gmail.com"));
    });
    test("User has a phone number", (){
      expect(contactDetails?.getPhoneNumber(), equals("0735334287"));
    });
    test("returns the pretty name", (){
      expect(contactDetails?.prettyName, equals("Curtis Schwoebel"));
    });
    test("can be turned into json", (){
      final fileString = File('test_resources/contact_details.json').readAsStringSync();
      expect(jsonEncode(contactDetails?.toJson()), equals(fileString));
    });
    test("can be created from json", (){
      final fileString = File('test_resources/contact_details.json').readAsStringSync();
      ContactDetails jsonMadeContactDetails = ContactDetails.fromJson(jsonDecode(fileString));
      expect(jsonMadeContactDetails.firstName, contactDetails?.firstName);
    });
    test("Order History", (){
      final fileString = File('test_resources/contact_details.json').readAsStringSync();
      ContactDetails jsonMadeContactDetails = ContactDetails.fromJson(jsonDecode(fileString));
      expect(jsonMadeContactDetails.orderHistory, isNotNull);
      expect(jsonMadeContactDetails.orderHistory[0].eggs.length, equals(2));
      expect(EggType.values.byName(jsonMadeContactDetails.orderHistory[0].eggs[0]) , EggType.softBoiled);
    });
  });

}
