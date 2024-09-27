import 'package:challenge_2/screens/detail/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PortionSelector extends StatelessWidget {
  final int portion;
  final ValueChanged<int> onPortionChanged;

  const PortionSelector({
    super.key,
    required this.portion,
    required this.onPortionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Portion",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        Row(
          children: [
            CustomIconButton(
              icon: Icons.remove,
              onTap: () {
                if (portion > 1) onPortionChanged(portion - 1);
              },
            ),
            const SizedBox(width: 15),
            Text(portion.toString(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(width: 15),
            CustomIconButton(
              icon: Icons.add,
              onTap: () {
                onPortionChanged(portion + 1);
              },
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    )
        .animate()
        .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
        .slideX(begin: 0.2, end: 0);
  }
}
