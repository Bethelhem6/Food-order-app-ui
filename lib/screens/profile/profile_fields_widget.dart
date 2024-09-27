// Reusable Profile Info Field widget
import 'package:flutter/material.dart';

class ProfileInfoField extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;

  const ProfileInfoField({
    super.key,
    required this.label,
    required this.value,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ),
              if (icon != null) Icon(icon, size: 18, color: Colors.black54),
            ],
          ),
        ),
      ],
    );
  }
}
