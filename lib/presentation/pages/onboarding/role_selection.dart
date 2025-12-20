import 'package:flutter/material.dart';
import 'package:smart_truck_app/presentation/resources/route_manager.dart';
import 'package:smart_truck_app/presentation/widgets/role_card.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  int _selectedRole = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Title
              const Text(
                'Select Your Role',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF111827),
                  letterSpacing: -0.5,
                ),
              ),

              const SizedBox(height: 20),

              // Subtitle
              Text(
                'Tell u`s who you are to get started with your freight journey.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 80),

              // Role Selection Cards
              Expanded(
                child: Column(
                  children: [
                    // Shipper Card
                    RoleCard(
                      title: 'SHIPPER',
                      description: 'I have freight, looking for carriers',
                      icon: Icons.local_shipping_outlined,
                      gradientColors: _selectedRole == 0
                          ? [const Color(0xFF1E3A8A), const Color(0xFF3B82F6)]
                          : [Colors.grey[100]!, Colors.grey[100]!],
                      textColor: _selectedRole == 0
                          ? Colors.white
                          : Colors.grey[700],
                      iconColor: _selectedRole == 0
                          ? Colors.white
                          : const Color(0xFF6B7280),
                      isSelected: _selectedRole == 0,
                      onTap: () => setState(() {
                        _selectedRole = 0;
                      }),

                      // Navigator.pushNamed(context, Routes.foCompleteProfile);
                    ),

                    const SizedBox(height: 20),

                    // Carrier Card
                    RoleCard(
                      title: 'CARRIER',
                      description: 'I have trucks, looking for freights ',
                      icon: Icons.fire_truck_outlined,
                      gradientColors: _selectedRole == 1
                          ? [const Color(0xFF1E3A8A), const Color(0xFF3B82F6)]
                          : [Colors.grey[100]!, Colors.grey[100]!],
                      textColor: _selectedRole == 1
                          ? Colors.white
                          : Colors.grey[700],
                      iconColor: _selectedRole == 1
                          ? Colors.white
                          : const Color(0xFF6B7280),
                      isSelected: _selectedRole == 1,
                      onTap: () => setState(() {
                        _selectedRole = 1;
                      }),

                      // Navigator.pushNamed(context, Routes.toCompleteProfile);
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    //  TODO: HANDLE CONTINUE ACTION.
                    _selectedRole == 0
                        ? Navigator.pushNamed(context, Routes.foCompleteProfile)
                        : Navigator.pushNamed(
                            context,
                            Routes.toCompleteProfile,
                          );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Login option
              Center(
                child: TextButton(
                  onPressed: () {
                    // Handle login navigation
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF6B7280),
                  ),
                  child: const Text(
                    'Already have an account? Login',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
}
