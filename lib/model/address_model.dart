import 'package:evira/styles/strings.dart';

class AddressModel {
  String country;
  String city;
  String street;
  String postcode;

  AddressModel({required this.country, required this.city, required this.street, required this.postcode});

  Map<String, dynamic> toMap() {
    return {
      AppProperties.columnCountry: country,
      AppProperties.columnCity: city,
      AppProperties.columnStreet: street,
      AppProperties.columnPostcode: postcode
    };
  }
}