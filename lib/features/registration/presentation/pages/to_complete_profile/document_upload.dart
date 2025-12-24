import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_truck_app/features/registration/presentation/pages/to_complete_profile/review_page.dart';

class DocumentUploadScreen extends StatefulWidget {
  const DocumentUploadScreen();

  @override
  State<DocumentUploadScreen> createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  final ImagePicker _picker = ImagePicker();

  // Document states
  File? _vehicleRegistration;
  File? _driversLicense;
  File? _insurancePolicy;

  // Loading states for each document
  bool _loadingVehicle = false;
  bool _loadingLicense = false;
  bool _loadingInsurance = false;

  Future<void> _pickImage(ImageSource source, String documentType) async {
    try {
      // Set loading state
      setState(() {
        if (documentType == 'vehicle') _loadingVehicle = true;
        if (documentType == 'license') _loadingLicense = true;
        if (documentType == 'insurance') _loadingInsurance = true;
      });

      final XFile? image = await _picker.pickImage(source: source);

      if (image != null) {
        final File file = File(image.path);

        setState(() {
          if (documentType == 'vehicle') {
            _vehicleRegistration = file;
          } else if (documentType == 'license') {
            _driversLicense = file;
          } else if (documentType == 'insurance') {
            _insurancePolicy = file;
          }
        });

        print('$documentType document selected: ${image.path}');
      }
    } catch (e) {
      print('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error selecting image: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      // Reset loading state
      setState(() {
        if (documentType == 'vehicle') _loadingVehicle = false;
        if (documentType == 'license') _loadingLicense = false;
        if (documentType == 'insurance') _loadingInsurance = false;
      });
    }
  }

  void _showImageSourceDialog(String documentType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera, documentType);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery, documentType);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _viewDocument(File? document, String title) {
    if (document == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No document uploaded'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SizedBox(
          height: 300,
          child: Image.file(document, fit: BoxFit.contain),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showImageSourceDialog(_getDocumentTypeFromTitle(title));
            },
            child: const Text('Replace'),
          ),
        ],
      ),
    );
  }

  String _getDocumentTypeFromTitle(String title) {
    if (title.toLowerCase().contains('vehicle')) return 'vehicle';
    if (title.toLowerCase().contains('license')) return 'license';
    if (title.toLowerCase().contains('insurance')) return 'insurance';
    return '';
  }

  void _submitDocuments() {
    final List<String> missingDocs = [];

    if (_vehicleRegistration == null) missingDocs.add('Vehicle Registration');
    if (_driversLicense == null) missingDocs.add("Driver's License");
    if (_insurancePolicy == null) missingDocs.add('Insurance Policy');

    if (missingDocs.isEmpty) {
      print('All documents submitted successfully!');
      print('Vehicle Registration: ${_vehicleRegistration!.path}');
      print("Driver's License: ${_driversLicense!.path}");
      print('Insurance Policy: ${_insurancePolicy!.path}');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Documents submitted successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReviewPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please upload: ${missingDocs.join(', ')}'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text("Document Uploads", style: TextStyle(fontSize: 25)),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 16),

            // // Title
            // const Text(
            //   "Document Uploads",
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.w700,
            //     color: Colors.black,
            //   ),
            // ),
            const SizedBox(height: 16),

            // Progress indicator
            // Row(
            //   children: [
            //     const Text(
            //       "Step 2 of 4",
            //       style: TextStyle(
            //         fontSize: 14,
            //         fontWeight: FontWeight.w500,
            //         color: Colors.grey,
            //       ),
            //     ),
            //     const SizedBox(width: 16),
            //     Expanded(
            //       child: LinearProgressIndicator(
            //         value: 0.8,
            //         backgroundColor: Colors.grey[200],
            //         color: Colors.blue,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //     ),
            //     const SizedBox(width: 16),
            //     const Text(
            //       "80%",
            //       style: TextStyle(
            //         fontSize: 14,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.blue,
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 8),

            // const Text(
            //   "Completed",
            //   style: TextStyle(
            //     fontSize: 12,
            //     color: Colors.grey,
            //   ),
            // ),

            // const SizedBox(height: 24),

            // const Divider(color: Colors.grey),

            // const SizedBox(height: 24),

            // Instructions
            const Text(
              "Verify your account",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Please upload clear photos of the required documents below. Ensure all text is legible.",
              style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.4),
            ),

            const SizedBox(height: 32),

            // TODO: DISPLAY SELECTED IMAGE HERE

            // Vehicle Registration Card
            _documentCard(
              title: "Vehicle Registration",
              status: _vehicleRegistration == null ? "Missing" : "Uploaded",
              file: _vehicleRegistration,
              isLoading: _loadingVehicle,
              onUpload: () => _showImageSourceDialog('vehicle'),
              onView: () =>
                  _viewDocument(_vehicleRegistration, 'Vehicle Registration'),
            ),

            const SizedBox(height: 20),

            // Driver's License Card
            _documentCard(
              title: "Driver's License",
              status: _driversLicense == null ? "Unloaded" : "Uploaded",
              file: _driversLicense,
              isLoading: _loadingLicense,
              onUpload: () => _showImageSourceDialog('license'),
              onView: () => _viewDocument(_driversLicense, "Driver's License"),
            ),

            const SizedBox(height: 20),

            // Insurance Policy Card
            _documentCard(
              title: "Insurance Policy",
              status: _insurancePolicy == null ? "Missing" : "Uploaded",
              file: _insurancePolicy,
              isLoading: _loadingInsurance,
              onUpload: () => _showImageSourceDialog('insurance'),
              onView: () => _viewDocument(_insurancePolicy, 'Insurance Policy'),
            ),

            const SizedBox(height: 40),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submitDocuments,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Submit Documents",
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
    );
  }

  // Widget _documentCard({
  //   required String title,
  //   required String status,
  //   required File? file,
  //   required bool isLoading,
  //   required VoidCallback onUpload,
  //   required VoidCallback onView,
  // }) {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.grey[50],
  //       borderRadius: BorderRadius.circular(12),
  //       border: Border.all(color: Colors.grey[300]!),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         // Title row
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               title,
  //               style: const TextStyle(
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.w600,
  //                 color: Colors.black87,
  //               ),
  //             ),
  //             Container(
  //               padding: const EdgeInsets.symmetric(
  //                 horizontal: 12,
  //                 vertical: 4,
  //               ),
  //               decoration: BoxDecoration(
  //                 color: status == "Uploaded"
  //                     ? Colors.green[50]
  //                     : Colors.orange[50],
  //                 borderRadius: BorderRadius.circular(20),
  //                 border: Border.all(
  //                   color: status == "Uploaded"
  //                       ? Colors.green[100]!
  //                       : Colors.orange[100]!,
  //                 ),
  //               ),
  //               child: Text(
  //                 status,
  //                 style: TextStyle(
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.w500,
  //                   color: status == "Uploaded"
  //                       ? Colors.green[700]
  //                       : Colors.orange[700],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),

  //         const SizedBox(height: 12),

  //         // Action buttons
  //         Row(
  //           children: [
  //             // Upload/Replace button
  //             Expanded(
  //               child: ElevatedButton.icon(
  //                 onPressed: isLoading ? null : onUpload,
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: Colors.white,
  //                   foregroundColor: Colors.blue,
  //                   side: const BorderSide(color: Colors.blue),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(8),
  //                   ),
  //                   padding: const EdgeInsets.symmetric(vertical: 12),
  //                 ),
  //                 icon: isLoading
  //                     ? const SizedBox(
  //                         width: 16,
  //                         height: 16,
  //                         child: CircularProgressIndicator(
  //                           strokeWidth: 2,
  //                           valueColor: AlwaysStoppedAnimation<Color>(
  //                             Colors.blue,
  //                           ),
  //                         ),
  //                       )
  //                     : const Icon(Icons.cloud_upload_outlined, size: 20),
  //                 label: isLoading
  //                     ? const Text("Uploading...")
  //                     : Text(file == null ? "Upload Photo" : "Replace"),
  //               ),
  //             ),

  //             const SizedBox(width: 12),

  //             // View button (only shown when file exists)
  //             if (file != null)
  //               Expanded(
  //                 child: OutlinedButton.icon(
  //                   onPressed: onView,
  //                   style: OutlinedButton.styleFrom(
  //                     side: const BorderSide(color: Colors.grey),
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                     ),
  //                     padding: const EdgeInsets.symmetric(vertical: 12),
  //                   ),
  //                   icon: const Icon(Icons.remove_red_eye_outlined, size: 20),
  //                   label: const Text("View"),
  //                 ),
  //               ),
  //           ],
  //         ),

  //         const SizedBox(height: 8),

  //         // File format hint
  //         Text(
  //           file == null
  //               ? "Upload JPG, PNG or PDF"
  //               : "File: ${file.path.split('/').last}",
  //           style: const TextStyle(fontSize: 12, color: Colors.grey),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _documentCard({
    required String title,
    required String status,
    required File? file,
    required bool isLoading,
    required VoidCallback onUpload,
    required VoidCallback onView,
  }) {
    // Check if we should show image preview
    bool shouldShowImagePreview = false;
    String? fileExtension;

    if (file != null) {
      fileExtension = file.path.split('.').last.toLowerCase();
      shouldShowImagePreview =
          fileExtension == 'jpg' ||
          fileExtension == 'jpeg' ||
          fileExtension == 'png';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image preview when file exists and is an image
        if (shouldShowImagePreview)
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
              color: Colors.grey[50],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                file!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.broken_image_outlined,
                          size: 48,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Failed to load image',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

        // The card itself
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: status == "Uploaded"
                          ? const Color(0xFFDCFCE7) // Green 50 equivalent
                          : const Color(0xFFFFEDD5), // Orange 50 equivalent
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: status == "Uploaded"
                            ? const Color(0xFF86EFAC) // Green 100
                            : const Color(0xFFFED7AA), // Orange 100
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (status == "Missing")
                          Container(
                            width: 6,
                            height: 6,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF97316), // Orange 500
                              shape: BoxShape.circle,
                            ),
                          ),
                        Text(
                          status,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: status == "Uploaded"
                                ? const Color(0xFF15803D) // Green 700
                                : const Color(0xFFC2410C), // Orange 700
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // File upload area
              GestureDetector(
                onTap: isLoading ? null : onUpload,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 1.5,
                      style: BorderStyle.solid,
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isLoading)
                        const CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blue,
                          ),
                        )
                      else
                        Icon(
                          file == null
                              ? Icons.cloud_upload_outlined
                              : shouldShowImagePreview
                              ? Icons.image_outlined
                              : Icons.picture_as_pdf_outlined,
                          size: 32,
                          color: Colors.grey,
                        ),
                      const SizedBox(height: 8),
                      Text(
                        isLoading
                            ? "Uploading..."
                            : file == null
                            ? "Tap to upload"
                            : "Tap to replace",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: file == null
                              ? FontWeight.w500
                              : FontWeight.normal,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        file == null
                            ? "JPG, PNG or PDF"
                            : shouldShowImagePreview
                            ? "Image: ${fileExtension!.toUpperCase()}"
                            : "PDF Document",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // View button (only when file exists)
              // if (file != null)
              //   SizedBox(
              //     width: double.infinity,
              //     child: ElevatedButton.icon(
              //       onPressed: onView,
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.white,
              //         foregroundColor: Colors.black87,
              //         side: BorderSide(color: Colors.grey[300]!),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         padding: const EdgeInsets.symmetric(vertical: 12),
              //       ),
              //       icon: Icon(
              //         shouldShowImagePreview ? Icons.remove_red_eye_outlined : Icons.picture_as_pdf,
              //         size: 20,
              //       ),
              //       label: Text(shouldShowImagePreview ? "View Image" : "View PDF"),
              //     ),
              //   ),
            ],
          ),
        ),
      ],
    );
  }
}
