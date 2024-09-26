import 'package:challenge_2/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColor.withOpacity(0.9),
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/image 6.png', // Replace with actual image link
                    ),
                    Image.asset(
                      'assets/image 6.png', // Replace with actual image link
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .3,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.9),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.white),
                          onPressed: () {
                            SystemChrome.setSystemUIOverlayStyle(
                                const SystemUiOverlayStyle(
                              statusBarColor: Colors.white,
                              statusBarIconBrightness: Brightness.dark,
                            ));
                            Navigator.pop(context);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.settings_outlined,
                              color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    // Profile Picture

                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 170),
                  padding: const EdgeInsets.only(top: 50),
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                // Name field
                                const ProfileInfoField(
                                  label: "Name",
                                  value: "Sophia Patel",
                                ),
                                const SizedBox(height: 10),
                                // Email field
                                const ProfileInfoField(
                                  label: "Email",
                                  value: "sophiapatel@gmail.com",
                                ),
                                const SizedBox(height: 10),
                                // Delivery Address field
                                const ProfileInfoField(
                                  label: "Delivery Address",
                                  value:
                                      "123 Main St Apartment 4A, New York, NY",
                                ),
                                const SizedBox(height: 10),
                                // Password field
                                const ProfileInfoField(
                                  label: "Password",
                                  value: "●●●●●●●●",
                                  icon: Icons.lock,
                                ),
                                const SizedBox(height: 20),
                                const Divider(),
                                const SizedBox(height: 10),
                                // Payment Details & Order History
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    "Payment Details",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    // Payment details action
                                  },
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    "Order History",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    // Order history action
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Spacer(),
                      // Edit Profile & Log Out buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Edit Profile Button
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // Edit profile action
                                },
                                icon:
                                    const Icon(Icons.edit, color: Colors.white),
                                label: const Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Log Out Button
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // Log out action
                                },
                                icon:
                                    const Icon(Icons.logout, color: Colors.red),
                                label: const Text(
                                  "Log out",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red),
                                ),
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(color: Colors.red),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Hero(
                  tag: "profile",
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 0.5,
                                blurRadius: 5,
                                offset: const Offset(0, 1),
                              ),
                            ],
                            border: Border.all(color: primaryColor, width: 3)),
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 5,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://th.bing.com/th/id/OIP.AcLhLt0m-3_LRbvI6NXAngHaHa?rs=1&pid=ImgDetMain'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          // Profile Information
        ],
      ),
    );
  }
}

// Reusable Profile Info Field widget
class ProfileInfoField extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;

  const ProfileInfoField({
    Key? key,
    required this.label,
    required this.value,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
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
