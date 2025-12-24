// import 'dart:io';

// class UserDraft {
//   // Screen 1
//   String? firstName;
//   String? licenseNumber;
//   int? yearsOfExperience;

//   // Screen 2
//   String? vehicleType;
//   String? make;
//   String? model;
//   String? licensePlateNumber;
//   int? year;
//   double? capacity;

//   // Screen 3
//   File? vehicleRegistration;
//   File? driversLicense;
//   File? insuranceProof;

//   UserDraft({
//     this.firstName,
//     this.licenseNumber,
//     this.yearsOfExperience,
//     List<File>? photos,
//     List<File>? documents,
//     this.vehicleType,
//     this.licensePlateNumber,
//     this.capacity,
//   }) : photos = photos ?? [],
//        documents = documents ?? [];
// }

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
}
