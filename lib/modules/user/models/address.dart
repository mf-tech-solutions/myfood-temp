import 'package:flutter/material.dart' show immutable, required;

@immutable
class Address {
  final int addressId;
  final String zipcode;
  final String street;
  final int number;
  final String complement;
  final bool isDefault;

  Address({
    @required this.zipcode,
    @required this.street,
    @required this.number,
    this.addressId,
    this.complement,
    this.isDefault,
  });

  Address copyWith({
    String zipcode,
    String street,
    int number,
    String complement,
    bool isDefault,
  }) {
    return Address(
      addressId: this.addressId,
      street: street ?? this.street,
      number: number ?? this.number,
      complement: complement ?? this.complement,
      zipcode: zipcode ?? this.zipcode,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  String toString() {
    return '$street, Nº $number ${complement ?? ''}';
  }
}
