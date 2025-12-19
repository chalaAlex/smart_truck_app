// import 'package:flutter/material.dart';
// import 'package:smart_truck_app/app/app.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp());
// }




import 'package:flutter/material.dart';

void main() => runApp(const FreightApp());

class FreightApp extends StatelessWidget {
  const FreightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freight Portal',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const RoleSelectionScreen(),
    );
  }
}

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
              // Logo and header
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 8.0),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'F',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'FreightPortal',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E3A8A),
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),

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

              const SizedBox(height: 8),

              // Subtitle
              Text(
                'Tell us who you are to get started with your freight journey.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 48),

              // Role Selection Cards
              Expanded(
                child: Column(
                  children: [
                    // Shipper Card
                    RoleCard(
                      title: 'SHIPPER',
                      description: 'I am looking for a freight carrier',
                      icon: Icons.local_shipping_outlined,
                      gradientColors: _selectedRole == 0
                          ? [const Color(0xFF1E3A8A), const Color(0xFF3B82F6)]
                          : [Colors.grey[100]!, Colors.grey[100]!],
                      textColor: _selectedRole == 0 ? Colors.white : Colors.grey[700],
                      iconColor: _selectedRole == 0 ? Colors.white : const Color(0xFF6B7280),
                      isSelected: _selectedRole == 0,
                      onTap: () => setState(() => _selectedRole = 0),
                    ),

                    const SizedBox(height: 20),

                    // Carrier Card
                    RoleCard(
                      title: 'CARRIER',
                      description: 'I am looking for a truck load',
                      icon: Icons.fire_truck_outlined,
                      gradientColors: _selectedRole == 1
                          ? [const Color(0xFF1E3A8A), const Color(0xFF3B82F6)]
                          : [Colors.grey[100]!, Colors.grey[100]!],
                      textColor: _selectedRole == 1 ? Colors.white : Colors.grey[700],
                      iconColor: _selectedRole == 1 ? Colors.white : const Color(0xFF6B7280),
                      isSelected: _selectedRole == 1,
                      onTap: () => setState(() => _selectedRole = 1),
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
                    // Handle continue action
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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
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
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
}

class RoleCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final List<Color> gradientColors;
  final Color? textColor;
  final Color iconColor;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.gradientColors,
    required this.textColor,
    required this.iconColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(
                  color: const Color(0xFF1E3A8A).withOpacity(0.3),
                  width: 2,
                )
              : Border.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF1E3A8A).withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.grey[200]!,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withOpacity(0.2)
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 28,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 16,
                  color: Color(0xFF1E3A8A),
                ),
              ),
          ],
        ),
      ),
    );
  }
}