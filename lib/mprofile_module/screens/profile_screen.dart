import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mprofile/mprofile_module/notifier/profile_notifier.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(editProfileProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.deepOrange),
        ),
        title: const Text(
          'Edit profile',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Avatar with Edit Badge
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0F2FE),
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFBAE6FD), width: 2),
                        ),
                        child: const Icon(
                          Icons.directions_bus,
                          size: 48,
                          color: Color(0xFF0EA5E9),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.deepOrange,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // First Name Field
                TextField(
                  onChanged: notifier.setFirstName,
                  decoration: const InputDecoration(
                    labelText: 'First name',
                    labelStyle: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Last Name Field
                TextField(
                  onChanged: notifier.setLastName,
                  decoration: const InputDecoration(
                    labelText: 'Last name',
                    labelStyle: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Date of Birth Field
                TextField(
                  readOnly: true,
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      notifier.setDob("${picked.toLocal()}".split(' ')[0]);
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Date of birth',
                    labelStyle: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                    hintText: 'Select date of birth',
                    hintStyle: TextStyle(color: Color(0xFFCBD5E1), fontSize: 15),
                    suffixIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF94A3B8)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Nationality Field
                TextField(
                  readOnly: true,
                  onTap: () {
                    // Open nationality picker dialog or bottom sheet
                  },
                  decoration: const InputDecoration(
                    labelText: 'Choose your nationality',
                    labelStyle: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                    hintText: 'Choose nationality',
                    hintStyle: TextStyle(color: Color(0xFFCBD5E1), fontSize: 15),
                    suffixIcon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF94A3B8)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Update Button
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle profile update logic
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}