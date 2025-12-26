import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:smart_truck_app/core/resources/route_manager.dart';
import 'package:smart_truck_app/features/registration/domain/entity/user_draft.dart';
import 'package:smart_truck_app/features/registration/presentation/controller/registration_draft_notifier.dart';
import 'package:logger/logger.dart';

class VehicleInformationScreen extends StatefulWidget {
  const VehicleInformationScreen();

  @override
  State<VehicleInformationScreen> createState() =>
      _VehicleInformationScreenState();
}

class _VehicleInformationScreenState extends State<VehicleInformationScreen> {
  bool isFromReiviewPage = false;
  @override
  void initState() {
    // Logics for prefilling forms while editing
    final draft = context.read<RegistrationDraftNotifier>().draft;
    vehicleTypeController = TextEditingController(
      text: draft.vehicleType ?? '',
    );
    isFromReiviewPage = true;

    logger.w("Vehicle Type: ${vehicleTypeController.text}");
    super.initState();
  }

  @override
  void dispose() {
    vehicleTypeController.dispose();
    super.dispose();
  }

  // To ensure init logic runs only once
  bool _initialized = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final draft = context.read<RegistrationDraftNotifier>().draft;
      // INIT controllers only once
      _initialized = true;
    }
  }

  final _formKey = GlobalKey<FormBuilderState>();
  var logger = Logger(printer: PrettyPrinter());

  // Text editing controllers
  TextEditingController vehicleTypeController = TextEditingController();
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController licensePlateController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController capacityController = TextEditingController();

  // Dropdown value
  String? _selectedVehicleType;
  UserDraft _userDraft = UserDraft();

  // Vehicle type options
  final List<String> _vehicleTypes = [
    'Truck',
    'Van',
    'SUV',
    'Pickup',
    'Sedan',
    'Motorcycle',
  ];

  void _submit(RegistrationDraftNotifier notifier) {
    try {
      final licensePlateNumber = int.tryParse(licensePlateController.text) ?? 0;
      final experience = int.tryParse(yearController.text) ?? 0;
      final capacity = double.tryParse(capacityController.text) ?? 0.0;

      final success = notifier.saveVehicleInfo(
        vehicleType: _selectedVehicleType!,
        make: makeController.text,
        model: modelController.text,
        licensePlateNumber: licensePlateNumber,
        year: experience,
        capacity: capacity,
      );
      if (!success) {
        return;
      }
    } catch (e) {
      print("Error parsing number: ${e.toString()}");
      return;
    }

    isFromReiviewPage ? Navigator.pushNamed(context, Routes.reviewPage) : Navigator.pushNamed(context, Routes.documentUploadScreen);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Provider instance.
    final notifier = context.read<RegistrationDraftNotifier>();

    return Scaffold(
      backgroundColor: Colors.white,
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
              const SizedBox(height: 16),
              const Text(
                "Vehicle Information",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 6),

              const Text(
                "Vehicle Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),

              const Text(
                "Please enter the details of the vehicle you will be using for deliveries.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 32),

              // Vehicle Type Dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Vehicle Type",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormBuilderDropdown<String>(
                    name: 'vehicle_type',
                    decoration: InputDecoration(
                      hintText:
                          // "Select type (e.g., Truck, Van ${notifier.draft.firstName})",
                          vehicleTypeController.text,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      suffixIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                    ),
                    items: _vehicleTypes
                        .map(
                          (type) =>
                              DropdownMenuItem(value: type, child: Text(type)),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedVehicleType = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select vehicle type';
                      }
                      return null;
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Make and Model Row
              Row(
                children: [
                  Expanded(
                    child: _inputField(
                      label: "Make",
                      controller: makeController,
                      hintText: "e.g. Ford",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter vehicle make';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _inputField(
                      label: "Model",
                      controller: modelController,
                      hintText: "e.g. Transit",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter vehicle model';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // License Plate Number
              _inputField(
                label: "License Plate Number",
                controller: licensePlateController,
                hintText: "ABC-1234",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter license plate number';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Year and Capacity Row
              Row(
                children: [
                  Expanded(
                    child: _inputField(
                      label: "Year",
                      controller: yearController,
                      hintText: "2024",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter year';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid year';
                        }
                        final year = int.parse(value);
                        if (year < 1900 || year > DateTime.now().year + 1) {
                          return 'Please enter a valid year';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _inputFieldWithSuffix(
                      label: "Capacity",
                      controller: capacityController,
                      hintText: "0.0",
                      suffixText: "tons",
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter capacity';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        final capacity = double.parse(value);
                        if (capacity < 0) {
                          return 'Capacity cannot be negative';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _submit(notifier);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        FormBuilderTextField(
          name: label.toLowerCase().replaceAll(' ', '_'),
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey[50],
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }

  Widget _inputFieldWithSuffix({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required String suffixText,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        FormBuilderTextField(
          name: label.toLowerCase().replaceAll(' ', '_'),
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            suffixText: suffixText,
            suffixStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey[50],
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
