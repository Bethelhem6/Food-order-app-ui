// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:challenge_2/screens/order%20summery/order_summery.dart';
import 'package:challenge_2/utils/colors.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomizeBurgerScreen extends StatefulWidget {
  const CustomizeBurgerScreen({super.key});

  @override
  _CustomizeBurgerScreenState createState() => _CustomizeBurgerScreenState();
}

class _CustomizeBurgerScreenState extends State<CustomizeBurgerScreen> {
  double _spicyLevel = 0.5;
  int _portion = 2;
  List<String> selectedToppings = [];
  List<String> selectedSideOptions = [];

  // Toppings list
  final List<Map<String, dynamic>> toppings = [
    {'name': 'Tomato', 'image': 'assets/pngwing 15.png'},
    {'name': 'Onions', 'image': 'assets/pngwing 16.png'},
    {'name': 'Pickles', 'image': 'assets/pngwing 17.png'},
    {'name': 'Bacons', 'image': 'assets/pngwing 18.png'},
  ];

  // Side options list
  final List<Map<String, dynamic>> sideOptions = [
    {'name': 'Fries', 'image': 'assets/image 14.png'},
    {'name': 'Coleslaw', 'image': 'assets/pngwing 18.png'},
    {'name': 'Salad', 'image': 'assets/pngwing 12.png'},
    {'name': 'Onion', 'image': 'assets/pngwing 14.png'},
  ];

  void toggleSelection(List<String> selectedList, String item) {
    setState(() {
      if (selectedList.contains(item)) {
        selectedList.remove(item);
      } else {
        selectedList.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Burger Image and Customization Section
            _buildBurgerImageAndCustomization(),
            const SizedBox(height: 10),
            // Toppings Section
            _buildSectionTitle('Toppings'),
            const SizedBox(height: 10),
            _buildOptionsGrid(toppings, selectedToppings, toggleSelection)
                .animate(delay: 400.ms)
                .shimmer(duration: const Duration(seconds: 1) - 200.ms)
                .flip(),
            const SizedBox(height: 20),
            // Side Options Section
            _buildSectionTitle('Side options'),
            const SizedBox(height: 10),
            _buildOptionsGrid(sideOptions, selectedSideOptions, toggleSelection)
                .animate(delay: 400.ms)
                .shimmer(duration: const Duration(seconds: 1) - 200.ms)
                .flip(),
          ],
        ),
      ),
      bottomSheet: _buildBottomOrderSummary(),
    );
  }

  Widget _buildBurgerImageAndCustomization() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Image.asset(
            'assets/pngwing 13.png',
            height: 300,
          ),
        )
            .animate(delay: 400.ms)
            .shimmer(duration: const Duration(seconds: 1) - 200.ms)
            .flip(),
        const SizedBox(width: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width * .4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Customize',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ).animate().fadeIn(
                  duration: 300.ms,
                  delay: const Duration(seconds: 1),
                  curve: Curves.easeInCirc),
              const SizedBox(height: 10),
              Text(
                'Your Burger to Your Tastes. Ultimate Experience',
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.grey[600]),
              ).animate().fadeIn(
                  duration: 300.ms,
                  delay: const Duration(seconds: 1),
                  curve: Curves.easeInCirc),
              const SizedBox(height: 15),
              _buildSpicySlider()
                  .animate()
                  .fadeIn(
                      duration: 300.ms,
                      delay: const Duration(seconds: 1),
                      curve: Curves.decelerate)
                  .slideX(begin: 0.2, end: 0),
              const SizedBox(height: 20),
              _buildPortionSelector()
                  .animate()
                  .fadeIn(
                      duration: 300.ms,
                      delay: const Duration(seconds: 1),
                      curve: Curves.decelerate)
                  .slideX(begin: 0.2, end: 0),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSpicySlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Spicy",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Slider(
          label: "Spicy",
          value: _spicyLevel,
          onChanged: (value) {
            setState(() {
              _spicyLevel = value;
            });
          },
          min: 0,
          max: 1,
          activeColor: Colors.red,
          inactiveColor: Colors.grey,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Mild", style: TextStyle(color: Colors.green)),
            Text("Hot", style: TextStyle(color: Colors.red)),
          ],
        ),
      ],
    );
  }

  Widget _buildPortionSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Portion",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _buildPortionButton(Icons.remove, () {
              setState(() {
                if (_portion > 1) _portion--;
              });
            }),
            const SizedBox(width: 15),
            Text(
              _portion.toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 15),
            _buildPortionButton(Icons.add, () {
              setState(() {
                _portion++;
              });
            }),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildPortionButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: .5,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _buildOptionsGrid(List<Map<String, dynamic>> options,
      List<String> selectedList, Function toggleSelection) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: options.map((option) {
        return GestureDetector(
          onTap: () => toggleSelection(selectedList, option['name']),
          child:
              _buildOptionItem(option, selectedList.contains(option['name'])),
        );
      }).toList(),
    );
  }

  Widget _buildOptionItem(Map<String, dynamic> option, bool isSelected) {
    return Container(
      height: 100,
      width: 85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 37, 13, 13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: .5,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Image.asset(
              option['image'],
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 3,
            right: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(option['name'],
                    style: const TextStyle(color: Colors.white, fontSize: 10)),
                Icon(isSelected ? Icons.add_circle : Icons.add_circle_outline,
                    color: Colors.red, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildBottomOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600),
              ),
              const Text(
                "\$16.49",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrderSummery()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text(
              "Order Now",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
