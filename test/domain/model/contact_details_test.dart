import 'package:eggp_app/domain/model/contact_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("contact details", (){
    ContactDetails? contactDetails;
    setUp((){
      contactDetails = ContactDetails("Curtis", "Schwoebel", "curtis.schwoebel@gmail.com", "0735334287");
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
  });

}
