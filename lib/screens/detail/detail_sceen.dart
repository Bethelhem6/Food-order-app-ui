// ignore_for_file: library_private_types_in_public_api

import 'package:challenge_2/screens/detail/order_button_widget.dart';
import 'package:challenge_2/screens/detail/portion_selector_widget.dart';
import 'package:challenge_2/screens/order%20summery/customize_burger_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FoodDetailScreen extends StatefulWidget {
  final Map<String, dynamic> foodItem;
  const FoodDetailScreen({super.key, required this.foodItem});

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  double _spicyLevel = 0.5;
  int _portion = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            HeaderRow(onBackTap: () => Navigator.of(context).pop()),
            const SizedBox(height: 20),
            AnimatedFoodImage(imagePath: widget.foodItem['image']),
            const SizedBox(height: 20),
            FoodDescription(
              name: widget.foodItem['name'],
              description: widget.foodItem['description'],
              rating: widget.foodItem['rating'],
              descriptionLong: widget.foodItem['descriptionLong'],
            ),
            const SizedBox(height: 20),
            SpicyAndPortionSelector(
              spicyLevel: _spicyLevel,
              onSpicyChanged: (value) => setState(() => _spicyLevel = value),
              portion: _portion,
              onPortionChanged: (value) => setState(() => _portion = value),
            ),
            const Spacer(),
            PriceAndOrderButton(
              price: "\$8.24",
              onOrderTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomizeBurgerScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  final VoidCallback onBackTap;

  const HeaderRow({super.key, required this.onBackTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 25),
          onPressed: onBackTap,
        ),
        IconButton(
          icon: const Icon(Icons.search, size: 25),
          onPressed: () {},
        ),
      ]
          .animate(interval: 200.ms, delay: const Duration(seconds: 1))
          .scaleXY(begin: 0, end: 1, duration: const Duration(seconds: 1)),
    );
  }
}

class AnimatedFoodImage extends StatelessWidget {
  final String imagePath;

  const AnimatedFoodImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(imagePath, height: 200)
          .animate()
          .scaleXY(begin: 0.0, end: 1.0, duration: const Duration(seconds: 1))
          .fadeIn()
          .blurXY(begin: 10, end: 0),
    );
  }
}

class FoodDescription extends StatelessWidget {
  final String name;
  final String description;
  final double rating;
  final String descriptionLong;

  const FoodDescription({
    super.key,
    required this.name,
    required this.description,
    required this.rating,
    required this.descriptionLong,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$name $description',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )
            .animate()
            .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
            .slideX(begin: 0.2, end: 0),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 18),
            const SizedBox(width: 5),
            Text(rating.toString(), style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 10),
            const Text("-   26 mins", style: TextStyle(color: Colors.grey)),
          ],
        )
            .animate()
            .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
            .slideX(begin: 0.2, end: 0),
        const SizedBox(height: 15),
        Text(
          descriptionLong,
          style: TextStyle(fontSize: 15, color: Colors.grey[600]),
        )
            .animate()
            .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
            .slideX(begin: 0.2, end: 0),
      ],
    );
  }
}

class SpicyAndPortionSelector extends StatelessWidget {
  final double spicyLevel;
  final ValueChanged<double> onSpicyChanged;
  final int portion;
  final ValueChanged<int> onPortionChanged;

  const SpicyAndPortionSelector({
    super.key,
    required this.spicyLevel,
    required this.onSpicyChanged,
    required this.portion,
    required this.onPortionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SpicySelector(spicyLevel: spicyLevel, onSpicyChanged: onSpicyChanged),
        PortionSelector(portion: portion, onPortionChanged: onPortionChanged),
      ],
    );
  }
}

class SpicySelector extends StatelessWidget {
  final double spicyLevel;
  final ValueChanged<double> onSpicyChanged;

  const SpicySelector({
    super.key,
    required this.spicyLevel,
    required this.onSpicyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Spicy",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Slider(
          label: "Spicy",
          value: spicyLevel,
          onChanged: onSpicyChanged,
          min: 0,
          max: 1,
          activeColor: Colors.red,
          inactiveColor: Colors.grey,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .45,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mild", style: TextStyle(fontSize: 16, color: Colors.green)),
              Text("Hot", style: TextStyle(fontSize: 16, color: Colors.red)),
            ],
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
        .slideX(begin: 0.2, end: 0);
  }
}
