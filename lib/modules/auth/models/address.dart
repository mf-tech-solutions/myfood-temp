import 'package:flutter/material.dart' show immutable, required;

@immutable
class Address {
  final int addressId;
  final String zipcode;
  final String street;
  final int number;
  final String complement;

  Address({
    @required this.addressId,
    @required this.zipcode,
    @required this.street,
    @required this.number,
    this.complement,
  });

  @override
  String toString() {
    return '$street, Nº $number ${complement ?? ''}';
  }
}
