import 'package:challenge_2/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomizeBurgerScreen extends StatefulWidget {
  @override
  _CustomizeBurgerScreenState createState() => _CustomizeBurgerScreenState();
}

class _CustomizeBurgerScreenState extends State<CustomizeBurgerScreen> {
  double _spicyLevel = 0.5;
  int _portion = 2;
  // double _totalPrice = 16.49;
  List<String> selectedToppings = [];
  List<String> selectedSideOptions = [];

  // List of toppings
  final List<Map<String, dynamic>> toppings = [
    {'name': 'Tomato', 'image': 'assets/pngwing 15.png'},
    {'name': 'Onions', 'image': 'assets/pngwing 16.png'},
    {'name': 'Pickles', 'image': 'assets/pngwing 17.png'},
    {'name': 'Bacons', 'image': 'assets/pngwing 18.png'},
  ];

  // List of side options
  final List<Map<String, dynamic>> sideOptions = [
    {'name': 'Fries', 'image': 'assets/image 14.png'},
    {'name': 'Coleslaw', 'image': 'assets/pngwing 18.png'},
    {'name': 'Salad', 'image': 'assets/pngwing 12.png'},
    {'name': 'Onion', 'image': 'assets/pngwing 14.png'},
  ];

  void toggleTopping(String topping) {
    setState(() {
      if (selectedToppings.contains(topping)) {
        selectedToppings.remove(topping);
      } else {
        selectedToppings.add(topping);
      }
    });
  }

  void toggleSideOption(String sideOption) {
    setState(() {
      if (selectedSideOptions.contains(sideOption)) {
        selectedSideOptions.remove(sideOption);
      } else {
        selectedSideOptions.add(sideOption);
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
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Image.asset(
                    'assets/pngwing 13.png', // Replace with actual image link
                    height: 300,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Customize ',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your Burger to Your Tastes. Ultimate Experience',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Spicy",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
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
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.green),
                                ),
                                Text(
                                  "Hot",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Portion",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
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
                                  child: const Icon(Icons.remove,
                                      color: Colors.white),
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
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: .5,
                                            blurRadius: 5,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Icon(Icons.add,
                                        color: Colors.white),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Toppings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: toppings.map((topping) {
                return GestureDetector(
                  onTap: () {
                    toggleTopping(topping['name']);
                  },
                  child: Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   color: selectedToppings.contains(topping['name'])
                    //       ? Colors.red[50]
                    //       : Colors.white,
                    //   border: Border.all(
                    //     color: selectedToppings.contains(topping['name'])
                    //         ? Colors.red
                    //         : Colors.grey,
                    //   ),
                    // ),
                    // padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 32, 15, 15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: .5,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      height: 100,
                      width: 85,
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
                              topping['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 3,
                            right: 3,
                            child: SizedBox(
                              width: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    topping['name'],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  Icon(
                                    selectedSideOptions
                                            .contains(topping['name'])
                                        ? Icons.add_circle
                                        : Icons.add_circle_outline,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              "Side options",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: sideOptions.map((sideOption) {
                return GestureDetector(
                  onTap: () {
                    toggleSideOption(sideOption['name']);
                  },
                  child: Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    //   color: selectedSideOptions.contains(sideOption['name'])
                    //       ? Colors.red[50]
                    //       : Colors.white,
                    //   border: Border.all(
                    //     color: selectedSideOptions.contains(sideOption['name'])
                    //         ? Colors.red
                    //         : Colors.grey,
                    //   ),
                    // ),
                    // padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 32, 15, 15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: .5,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      height: 100,
                      width: 85,
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
                              sideOption['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 3,
                            right: 3,
                            child: SizedBox(
                              width: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    sideOption['name'],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  Icon(
                                    selectedSideOptions
                                            .contains(sideOption['name'])
                                        ? Icons.add_circle
                                        : Icons.add_circle_outline,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomSheet: Container(
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
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
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
                "ORDER NOW",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
