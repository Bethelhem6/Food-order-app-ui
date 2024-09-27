import 'package:challenge_2/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PriceAndOrderButton extends StatelessWidget {
  final String price;
  final VoidCallback onOrderTap;

  const PriceAndOrderButton(
      {super.key, required this.price, required this.onOrderTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: BoxDecoration(
            // color: primaryColor,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.5),
            //     spreadRadius: .5,
            //     blurRadius: 5,
            //     offset: const Offset(0, 3),
            //   ),
            // ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            price,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: primaryColor),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
            backgroundColor: Colors.black87,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          onPressed: onOrderTap,
          child: const Text("ORDER NOW",
              style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
        .slideX(begin: 0.2, end: 0);
  }
}
