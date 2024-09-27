import 'package:challenge_2/screens/home/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SizedBox(
        width: 300, // Custom width of dialog
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.red,
              child: Icon(Icons.check, size: 50, color: Colors.white),
            )
                .animate()
                .scaleXY(
                    begin: 0.0,
                    end: 1.0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate)
                .fadeIn()
                .blurXY(begin: 10, end: 0),
            const SizedBox(height: 20),
            const Text(
              'Success!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            )
                .animate()
                .scaleXY(
                    begin: 0.0,
                    end: 1.0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate)
                .fadeIn()
                .blurXY(begin: 10, end: 0),
            const SizedBox(height: 10),
            const Text(
              'Your payment was successful.\nA receipt for this purchase has been sent to your email.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            )
                .animate()
                .scaleXY(
                    begin: 0.0,
                    end: 1.0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate)
                .fadeIn()
                .blurXY(begin: 10, end: 0),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Button color
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 90),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnimatedBottomBar()),
                    (route) => false);
              },
              child: const Text(
                'Go Back',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
                .animate()
                .fadeIn(
                    duration: 300.ms,
                    delay: const Duration(seconds: 1),
                    curve: Curves.decelerate)
                .slideY(begin: 0.5, end: 0),
            const SizedBox(height: 20),
          ],
        ),
      ),
    )
        .animate()
        .scaleXY(
            begin: 0.0,
            end: 1.0,
            duration: const Duration(microseconds: 500),
            curve: Curves.decelerate)
        .fadeIn()
        .blurXY(begin: 10, end: 0);
  }
}

// Function to show the dialog
void showPaymentSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const PaymentSuccessDialog();
    },
  );
}
