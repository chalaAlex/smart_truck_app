// import 'package:flutter/material.dart';
// import 'package:smart_truck_app/core/resources/route_manager.dart';

// class ToCompleteProfile extends StatelessWidget {
//   const ToCompleteProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(child: Text("TO COMPLETE PROFILE")),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pushNamed(context, Routes.addVehicle);
//               // TODO: TAKE THE USER TO TO HOMEPAGE SCREEN
//             },
//             child: Text("Next"),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:smart_truck_app/core/resources/route_manager.dart';
import 'package:smart_truck_app/features/registration/presentation/pages/to_complete_profile/add_vehicle.dart';

class ToCompleteProfile extends StatefulWidget {
  const ToCompleteProfile({super.key});

  @override
  State<ToCompleteProfile> createState() => _ToCompleteProfileState();
}

class _ToCompleteProfileState extends State<ToCompleteProfile> {
  final _formKey = GlobalKey<FormBuilderState>();

  // Controllers
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController licenseNumberController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();

  // Submit handler
  void _submit() {
    final formState = _formKey.currentState;

    if (formState!.validate()) {
      debugPrint("Driver Name: ${driverNameController.text}");
      debugPrint("License Number: ${licenseNumberController.text}");
      debugPrint("Years of Experience: ${experienceController.text}");

      // Navigate to next step
      // Navigator.push(context, MaterialPageRoute(builder: (_) => NextScreen()));
    } else {
      debugPrint("Validation failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // remove later when theming
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Driver Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              _inputField(
                label: "Driver Name",
                hint: "Enter full name",
                icon: Icons.person_outline,
                controller: driverNameController,
              ),

              const SizedBox(height: 16),

              _inputField(
                label: "License Number",
                hint: "E.g. D12345678",
                icon: Icons.badge_outlined,
                controller: licenseNumberController,
                helperText: "Must match the physical license ID.",
              ),

              const SizedBox(height: 16),

              _inputField(
                label: "Years of Experience",
                hint: "e.g. 5",
                icon: Icons.timer_outlined,
                controller: experienceController,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 32),

              _submitButton(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Reusable input field (same style as your other screens)
  Widget _inputField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    String? helperText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        const SizedBox(height: 6),
        FormBuilderTextField(
          name: label,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            helperText: helperText,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          // validator: FormBuilderValidators.required(),
        ),
      ],
    );
  }

  // 🔹 Bottom button
  Widget _submitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _submit,
        style: ElevatedButton.styleFrom(
          // backgroundColor: AppColors.kPrimaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Next", style: TextStyle(fontSize: 16)),
            SizedBox(width: 8),
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      VehicleInformationScreen(name: driverNameController.text),
                ),
              ),
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
