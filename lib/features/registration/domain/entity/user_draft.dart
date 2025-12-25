import 'dart:io';

class UserDraft {
  // ------------------------
  // Screen 1 – Driver Info
  // ------------------------
  String? firstName;
  String? licenseNumber;
  int yearsOfExperience = 0;

  // ------------------------
  // Screen 2 – Vehicle Info
  // ------------------------
  String? vehicleType;
  String? make;
  String? model;
  int? licensePlateNumber;
  int? year;
  double? capacity;

  // ------------------------
  // Screen 3 – Documents
  // ------------------------
  File? vehicleRegistration;
  File? driversLicense;
  File? insuranceProof;

  UserDraft({
    this.firstName,
    this.licenseNumber,
    this.yearsOfExperience = 0,
    this.vehicleType,
    this.make,
    this.model,
    this.licensePlateNumber,
    this.year,
    this.capacity,
    this.vehicleRegistration,
    this.driversLicense,
    this.insuranceProof,
  });
}
