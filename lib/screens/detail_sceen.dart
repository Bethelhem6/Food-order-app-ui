import 'package:challenge_2/screens/customize_burger_screen.dart';
import 'package:challenge_2/utils/colors.dart';
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
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 25,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    size: 25,
                  ),
                ),
              ]
                  .animate(interval: 200.ms, delay: const Duration(seconds: 1))
                  .scaleXY(
                      begin: 0,
                      end: 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.decelerate),
            ),
            Center(
              child: Image.asset(
                widget.foodItem['image'], // Replace with actual image link
                height: 200,
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
            const SizedBox(height: 20),
            Text(
              '${widget.foodItem['name']} ${widget.foodItem['description']}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )
                .animate()
                .fadeIn(
                    duration: 300.ms,
                    delay: const Duration(seconds: 1),
                    curve: Curves.decelerate)
                .slideX(begin: 0.2, end: 0),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 18),
                const SizedBox(width: 5),
                Text(
                  widget.foodItem['rating'].toString(),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 10),
                const Text("-   26 mins", style: TextStyle(color: Colors.grey)),
              ],
            )
                .animate()
                .fadeIn(
                    duration: 300.ms,
                    delay: const Duration(seconds: 1),
                    curve: Curves.decelerate)
                .slideX(begin: 0.2, end: 0),
            const SizedBox(height: 15),
            Text(
              widget.foodItem['descriptionLong'],
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            )
                .animate()
                .fadeIn(
                    duration: 300.ms,
                    delay: const Duration(seconds: 1),
                    curve: Curves.decelerate)
                .slideX(begin: 0.2, end: 0),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Spicy",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .45,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mild",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.green),
                          ),
                          Text(
                            "Hot",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.red),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Portion",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_portion > 1) _portion--;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: .5,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15)),
                            child:
                                const Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          _portion.toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 15),
                        InkWell(
                            onTap: () {
                              setState(() {
                                setState(() {
                                  _portion++;
                                });
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: .5,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Icon(Icons.add, color: Colors.white),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
            )
                .animate()
                .fadeIn(
                    duration: 300.ms,
                    delay: const Duration(seconds: 1),
                    curve: Curves.easeInOut)
                .slideX(begin: 0.2, end: 0),
            const SizedBox(height: 20),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: .5,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "\$8.24",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 16),
                    // primary: Colors.black,
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomizeBurgerScreen()));
                  },
                  child: const Text(
                    "ORDER NOW",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
