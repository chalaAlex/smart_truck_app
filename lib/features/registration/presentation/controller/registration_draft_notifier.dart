import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smart_truck_app/features/registration/domain/entity/user_draft.dart';

class RegistrationDraftNotifier extends ChangeNotifier {
  final UserDraft _draft = UserDraft();

  UserDraft get draft => _draft;

  // ========================
  // Screen 1 – Driver Info
  // ========================
  bool saveDriverInfo({
    required String firstName,
    required String licenseNumber,
    required int yearsOfExperience,
  }) {
    if (firstName.isEmpty || licenseNumber.isEmpty || yearsOfExperience < 0) {
      return false;
    }

    if (firstName.isNotEmpty ||
        licenseNumber.isNotEmpty ||
        yearsOfExperience < 0) {
      _draft.firstName = firstName;
      _draft.licenseNumber = licenseNumber;
      _draft.yearsOfExperience = yearsOfExperience;

      print("Notifier called");
    }

    notifyListeners();
    return true;
  }

  // ========================
  // Screen 2 – Vehicle Info
  // ========================
  bool saveVehicleInfo({
    required String vehicleType,
    required String make,
    required String model,
    required int licensePlateNumber,
    required int year,
    required double capacity,
  }) {
    if (vehicleType.isEmpty ||
        make.isEmpty ||
        model.isEmpty ||
        licensePlateNumber.isNegative ||
        year < 1900 ||
        capacity <= 0) {
      print("Vehicle Info Notifier called with failed");
      return false;
    }

    if (vehicleType.isNotEmpty ||
        make.isNotEmpty ||
        model.isNotEmpty ||
        licensePlateNumber.isNegative ||
        year < 1900 ||
        capacity <= 0) {
      _draft.vehicleType = vehicleType;
      _draft.make = make;
      _draft.model = model;
      _draft.licensePlateNumber = licensePlateNumber;
      _draft.year = year;
      _draft.capacity = capacity;

      print("Vehicle Info Notifier called");
    }

    notifyListeners();
    return true;
  }

  // ========================
  // Screen 3 – Documents
  // ========================
  bool saveDocuments({
    required File vehicleRegistration,
    required File driversLicense,
    required File insuranceProof,
  }) {
    if (!vehicleRegistration.existsSync() ||
        !driversLicense.existsSync() ||
        !insuranceProof.existsSync()) {
      return false;
    }

    _draft.vehicleRegistration = vehicleRegistration;
    _draft.driversLicense = driversLicense;
    _draft.insuranceProof = insuranceProof;

    notifyListeners();
    return true;
  }

  // ========================
  // Final submission cleanup
  // ========================
  void clearDraft() {
    _draft
      ..firstName = null
      ..licenseNumber = null
      ..yearsOfExperience = 0
      ..vehicleType = null
      ..make = null
      ..model = null
      ..licensePlateNumber = null
      ..year = null
      ..capacity = null
      ..vehicleRegistration = null
      ..driversLicense = null
      ..insuranceProof = null;

    notifyListeners();
  }
}
