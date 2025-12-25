import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:smart_truck_app/features/registration/presentation/controller/registration_draft_notifier.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage();

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    // Provider instance.
    final notifier = context.read<RegistrationDraftNotifier>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Row(children: [screenPageName(), Spacer(), edit()]),
                driverInfoCard(
                  fullName: notifier.draft.firstName!,
                  licenseNumber: notifier.draft.licenseNumber!,
                  experience: notifier.draft.yearsOfExperience.toString(),
                  phone: "(555) 123-4567",
                ),
                SizedBox(height: 20),
                truckDetailsCard(
                  file: notifier.draft.driversLicense,
                  type: "Box Truck",
                  makeModel: "Ford F-650",
                  year: "2022",
                  licensePlate: "LGT - 9876",
                  capacity: "26,000 lbs",
                  color: "White",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget screenPageName() {
  return Text(
    "Driver Details",
    style: TextStyle(fontSize: 20, fontWeight: .bold),
  );
}

Widget edit() {
  return Row(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
      Text("Edit", style: TextStyle(fontSize: 20)),
    ],
  );
}

Widget driverDetailReview() {
  return Container(
    decoration: BoxDecoration(),
    child: Row(children: [Column(), Column()]),
  );
}

Widget driverInfoCard({
  required String fullName,
  required String licenseNumber,
  required String experience,
  required String phone,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.black.withOpacity(0.1)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _infoColumn(label: "FULL NAME", value: fullName),
            _infoColumn(label: "LICENSE NUMBER", value: licenseNumber),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _infoColumn(label: "EXPERIENCE", value: experience),
            _infoColumn(label: "PHONE", value: phone),
          ],
        ),
      ],
    ),
  );
}

Widget _infoColumn({required String label, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 10,
          letterSpacing: 1,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        value,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    ],
  );
}

// Reusable Truck detail card
Widget truckDetailsCard({
  required File? file,
  required String type,
  required String makeModel,
  required String year,
  required String licensePlate,
  required String capacity,
  required String color,
}) {
  return Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.black.withOpacity(0.08)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const Icon(Icons.local_shipping, size: 38, color: Color(0xFFC9B590)),
        const SizedBox(height: 18),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: file != null
              ? Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
                      padding: EdgeInsets.all(8),
                      child: Image.file(file, height: 120),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.file(file, height: 120),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.file(file, height: 120),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.file(file, height: 120),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.file(file, height: 120),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.file(file, height: 120),
                    ),
                  ],
                )
              : Container(
                  height: 120,
                  width: 200,
                  color: Colors.grey.shade200,
                  child: const Icon(
                    Icons.local_shipping,
                    size: 38,
                    color: Color(0xFFC9B590),
                  ),
                ),
        ),

        // INFO GRID
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _truckItem(label: "TYPE", value: type),
                _truckItem(label: "MAKE / MODEL", value: makeModel),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _truckItem(label: "YEAR", value: year),
                _licensePlate(label: "LICENSE PLATE", plate: licensePlate),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _truckItem(label: "CAPACITY", value: capacity),
                _truckColor(label: "COLOR", color: color),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

// small label + value pattern
Widget _truckItem({required String label, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade600,
          letterSpacing: 1,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        value,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    ],
  );
}

// license plate badge
Widget _licensePlate({required String label, required String plate}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
          color: Colors.grey.shade600,
        ),
      ),
      const SizedBox(height: 6),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          color: Colors.white,
        ),
        child: Text(
          plate,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ),
    ],
  );
}

// color row
Widget _truckColor({required String label, required String color}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
          color: Colors.grey.shade600,
        ),
      ),
      const SizedBox(height: 6),
      Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black.withOpacity(.4)),
              color: color.toLowerCase() == "white"
                  ? Colors.white
                  : Colors.grey, // you can map real colors here
            ),
          ),
          const SizedBox(width: 6),
          Text(
            color,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ],
      ),
    ],
  );
}
