// import 'package:flutter/material.dart';
// import 'package:smart_truck_app/presentation/resources/route_manager.dart';

// class FoCompleteProfile extends StatelessWidget {
//   const FoCompleteProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(child: Text("FO COMPLETE PROFILE")),

//           ElevatedButton(
//             onPressed: () {
//               // TODO: TAKE THE USER TO FO HOMEPAGE SCREEN
//               Navigator.pushNamed(context, Routes.foHomePage);
//             },
//             child: Text("Complete"),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_truck_app/features/registration/presentation/pages/auth/login.screen.dart';
import 'package:smart_truck_app/utils/constants/app_colors.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Helper methods
  void _submit() {
    final formState = _formKey.currentState;

    if (formState?.saveAndValidate() ?? false) {
      print("name: ${nameController.text}");
      print("last name: ${lastNameController.text}");
      print("password: ${passwordController.text}");
      print("password confirm: ${confirmPasswordController.text}");
      print("email: ${emailController.text}");
    } else {
      debugPrint('Validation failed');
    }
  }

  // Text editing controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white, // REMOVE LATER WHEN WORKING ON THEMES.
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _roleChip(),
              const SizedBox(height: 16),
              const Text(
                "Complete Profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),

              const Text(
                "Fill in your details to finalize your account setup and start shipping.",
                style: TextStyle(fontSize: 14, color: AppColors.kTextGray),
              ),

              const SizedBox(height: 24),

              // _stepIndicator(),
              const SizedBox(height: 24),
              _nameFields(),

              const SizedBox(height: 16),
              _inputField(
                label: "Email Address",
                controller: emailController,
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 16),
              _passwordField(
                label: "Password",
                controller: passwordController,
                obscure: _obscurePassword,
                toggle: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
              ),

              const SizedBox(height: 8),

              // _passwordStrength(),
              const SizedBox(height: 16),
              _passwordField(
                label: "Confirm Password",
                controller: confirmPasswordController,
                obscure: _obscureConfirmPassword,
                toggle: () => setState(
                  () => _obscureConfirmPassword = !_obscureConfirmPassword,
                ),
              ),

              const SizedBox(height: 24),
              _submitButton(size),

              const SizedBox(height: 16),
              _loginText(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------- CHIPS -------------------- //
  /// 🔵 ROLE CHIP
  Widget _roleChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.kLightBlueBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        "FREIGHT OWNER",
        style: TextStyle(
          color: AppColors.kPrimaryBlue,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// 🔵 STEP INDICATOR
  Widget _stepIndicator() {
    return Row(
      children: [
        _stepItem("ROLE", isActive: false),
        _divider(),
        _stepItem("DETAILS", isActive: true),
        _divider(),
        _stepItem("VERIFY", isActive: false),
      ],
    );
  }

  Widget _stepItem(String title, {required bool isActive}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: isActive ? AppColors.kPrimaryBlue : AppColors.kTextGray,
      ),
    );
  }

  Widget _divider() {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        color: AppColors.kBorderGray,
      ),
    );
  }

  /// 🔵 INPUT FIELDS
  Widget _nameFields() {
    return Row(
      children: [
        Expanded(
          child: _inputField(
            label: "First Name",
            controller: nameController,
            icon: Icons.person_outline,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _inputField(
            label: "Last Name",
            controller: lastNameController,
            icon: Icons.person_outline,
          ),
        ),
      ],
    );
  }

  Widget _inputField({
    required String label,
    required TextEditingController controller,
    // required String hint,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        FormBuilderTextField(
          controller: controller,
          onChanged: (label) {
            print("?????????? $label");
          },
          name: 'name',
          decoration: const InputDecoration(
            // labelText: 'Full Name',
            // hintText: 'Enter your name',
            border: OutlineInputBorder(),
          ),
          // validator: FormBuilderValidators.compose([
          //   FormBuilderValidators.required(),
          //   FormBuilderValidators.minLength(2),
          // ]),
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }

  /// 🔵 PASSWORD
  Widget _passwordField({
    required String label,
    required TextEditingController controller,
    // required String hintText,
    required bool obscure,
    required VoidCallback toggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        FormBuilderTextField(
          controller: controller,
          onChanged: (label) {
            // TODO:
          },
          name: 'name',
          decoration: InputDecoration(border: OutlineInputBorder()),
          // validator: FormBuilderValidators.compose([
          //   FormBuilderValidators.required(),
          //   FormBuilderValidators.minLength(2),
          // ]),
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }

  /// 🔵 PASSWORD STRENGTH
  Widget _passwordStrength() {
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: 0.75,
            backgroundColor: AppColors.kBorderGray,
            color: AppColors.kPrimaryBlue,
            minHeight: 6,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          "Strong",
          style: TextStyle(
            color: AppColors.kPrimaryBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  /// 🔵 BUTTON
  Widget _submitButton(Size size) {
    return SizedBox(
      width: size.width,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: _submit,
        child: const Text(
          "Complete Registration →",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  /// 🔵 LOGIN TEXT
  Widget _loginText() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: "Already have an account? ",
          style: const TextStyle(color: AppColors.kTextGray),
          children: [
            TextSpan(
              text: "Log in",
              style: const TextStyle(
                color: AppColors.kPrimaryBlue,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
