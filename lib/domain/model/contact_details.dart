import 'order_history.dart';

class ContactDetails {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phoneNumber;
  late final List<OrderHistory> orderHistory;

  ContactDetails(
      this.firstName, this.lastName, this.emailAddress, this.phoneNumber);

  String getFirstName() {
    return firstName;
  }

  String getLastName() {
    return lastName;
  }

  String getEmailAddress() {
    return emailAddress;
  }

  String getPhoneNumber() {
    return phoneNumber;
  }

  get prettyName => '$firstName $lastName';

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "emailAddress": emailAddress,
        "phoneNumber": phoneNumber,
        "orderHistory": orderHistory.map((e) => e.toJson()).toList()
      };

  ContactDetails.fromJson(Map<String, dynamic> jsonMap)
      : firstName = jsonMap['firstName'],
        lastName = jsonMap['lastName'],
        emailAddress = jsonMap['emailAddress'],
        phoneNumber = jsonMap['phoneNumber'],
        orderHistory = List<OrderHistory>.from(jsonMap['orderHistory'].map((model)=> OrderHistory.fromJson(model)));
}
