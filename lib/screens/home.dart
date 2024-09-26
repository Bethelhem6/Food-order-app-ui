import 'package:challenge_2/screens/detail_sceen.dart';
import 'package:challenge_2/screens/profile_screen.dart';
import 'package:challenge_2/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/foodgo.svg",
                        height: 45,
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcATop,
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileScreen()));
                      },
                      child: Hero(
                        tag: "profile",
                        child: Container(
                          height: 50,
                          width: 65,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://th.bing.com/th/id/OIP.AcLhLt0m-3_LRbvI6NXAngHaHa?rs=1&pid=ImgDetMain'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 0,
                ),
                Text(
                  "Order your favourite food!",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 0.5,
                            blurRadius: 5,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Search',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      child: Container(
                    height: 56,
                    width: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: .5,
                          blurRadius: 5,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset("assets/settings-sliders.svg",
                        height: 25,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcATop,
                        )),
                  ))
                ]),
                const SizedBox(height: 15),
                TabBar(
                  dividerHeight: 0,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  indicator: const BoxDecoration(),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                  tabs: [
                    tabs(
                      'All',
                      true,
                    ),
                    tabs(
                      'Combos',
                      false,
                    ),
                    tabs(
                      'Sliders',
                      false,
                    ),
                    tabs(
                      'Classics',
                      false,
                    ),
                  ],
                ),
                // const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: foodItems.length,
                    itemBuilder: (context, index) {
                      final foodItem = foodItems[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FoodDetailScreen(
                                        foodItem: foodItem,
                                      )));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: .5,
                                blurRadius: 5,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                alignment: Alignment.center,
                                height: 120,
                                // width: 120,
                                child: Image.asset(
                                  foodItem['image'],
                                  fit: BoxFit.cover,
                                ),
                              )
                                  .animate(delay: 400.ms)
                                  .shimmer(
                                      duration:
                                          const Duration(seconds: 1) - 200.ms)
                                  .flip(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      foodItem['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      foodItem['description'],
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.star,
                                                color: Colors.amber, size: 16),
                                            Text(foodItem['rating'].toString()),
                                          ],
                                        ),
                                        const Icon(Icons.favorite_border),
                                      ],
                                    )
                                  ],
                                ),
                              )
                                  .animate()
                                  .fadeIn(
                                      duration: 300.ms,
                                      delay: const Duration(seconds: 1),
                                      curve: Curves.decelerate)
                                  .slideX(begin: 0.2, end: 0),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> foodItems = [
  {
    'name': 'Cheeseburger',
    'description': "Wendy's Burger",
    'descriptionLong':
        "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
    'rating': 4.9,
    'image': 'assets/image 9.png', // Replace with actual image link
  },
  {
    'name': 'Veggie Burger',
    'description': "Hamburger",
    'descriptionLong':
        'Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. ',
    'rating': 4.8,
    'image': 'assets/image 10.png', // Replace with actual image link
  },
  {
    'name': 'Chicken Burger',
    'description': "Hamburger",
    'descriptionLong':
        'Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!',
    'rating': 4.6,
    'image': 'assets/image 11.png', // Replace with actual image link
  },
  {
    'name': 'Fried Chicken Burger',
    'description': "Hamburger",
    'descriptionLong':
        'Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.',
    'rating': 4.5,
    'image': 'assets/image 12.png', // Replace with actual image link
  },
];
Container tabs(String skill, bool isSelected) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    decoration: BoxDecoration(
      color: isSelected ? primaryColor : Colors.grey.shade200,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Text(
      skill,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: isSelected ? Colors.white : Colors.grey.shade500,
          fontSize: 14),
    ),
  );
}
