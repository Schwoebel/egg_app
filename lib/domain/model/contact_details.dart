
class ContactDetails {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phoneNumber;
  ContactDetails(this.firstName, this.lastName, this.emailAddress, this.phoneNumber);

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
}