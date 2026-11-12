import 'package:flutter/material.dart';

Widget supportView() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          _buildSupportTile(
            icon: Icons.chat_bubble_outline,
            title: 'Live Support',
            subtitle: 'Live support from our customer care agents\n(08:00AM - 07:00PM)',
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
          _buildSupportTile(
            icon: Icons.headset_mic_outlined,
            title: 'Contact',
            subtitle: 'Email and Mobile number',
            onTap: () {},
          ),
          const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
          _buildSupportTile(
            icon: Icons.help_outline,
            title: 'FAQs',
            subtitle: 'Frequently asked questions',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSupportTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: const Color(0xFF64748B), size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1E293B),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF64748B),
            height: 1.3,
          ),
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF94A3B8)),
      onTap: onTap,
    );
  }
