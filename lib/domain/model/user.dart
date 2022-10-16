import 'contact_details.dart';

class User{
  String id;
  ContactDetails contactDetails;
  late final String token;
  User(this.contactDetails, this.id);

  ContactDetails getContactDetails() {
    return contactDetails;
  }

  String getId() {
    return id;
  }

  void setToken(String token){
    this.token = token;
  }

  String getToken(){
    return token;
  }

  get prettyContactName => contactDetails.prettyName;

  Map<String, dynamic> toJson() => {
    "id": id,
    "contactDetails": contactDetails.toJson()
  };

  User.fromJson(Map<String, dynamic> jsonMap)
  : id = jsonMap["id"],
  contactDetails = ContactDetails.fromJson(jsonMap["contactDetails"]);

}