import 'package:flutter/material.dart';

Widget testimonialCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=200&q=80',
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Mehdi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.verified, color: Colors.blue, size: 16),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '9 months ago on Google',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(
              5,
              (index) => const Icon(Icons.star, color: Colors.amber, size: 18),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Je recommande a 110%. Le service client est vraiment exceptionnel et rapide pour résoudre les problèmes.',
            style: TextStyle(
              color: Color(0xFF334155),
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }