class ContactDetails {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phoneNumber;
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

  Map<String, String> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "emailAddress": emailAddress,
        "phoneNumber": phoneNumber
      };

  ContactDetails.fromJson(Map<String, dynamic> jsonMap)
      : firstName = jsonMap['firstName'],
        lastName = jsonMap['lastName'],
        emailAddress = jsonMap['emailAddress'],
        phoneNumber = jsonMap['phoneNumber'];
}
