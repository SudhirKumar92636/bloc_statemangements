import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class ApplayMembershipEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ApplayMembershipSubmitted extends ApplayMembershipEvent {
  final String name;
  final String membershipId;
  final String houseNo;
  final String street;
  final String city;
  final String district;
  final String state;
  final String landmark;
  final String pincode;
  final String contactNo;
  final File? image;

  ApplayMembershipSubmitted({
    required this.name,
    required this.membershipId,
    required this.houseNo,
    required this.street,
    required this.city,
    required this.district,
    required this.state,
    required this.landmark,
    required this.pincode,
    required this.contactNo,
    this.image,
  });

  @override
  List<Object?> get props => [
    name,
    membershipId,
    houseNo,
    street,
    city,
    district,
    state,
    landmark,
    pincode,
    contactNo,
    image,
  ];
}
