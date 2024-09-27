import 'package:challenge_2/screens/profile/profile_fields_widget.dart';
import 'package:challenge_2/screens/profile/profile_picture_widget.dart';
import 'package:challenge_2/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
          ProfileHeader(
            onBackTap: () {
              SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ));
              Navigator.pop(context);
            },
            onSettingsTap: () {
              // Settings action here
            },
          ),
          ProfileBody(
            profileImageUrl:
                'https://th.bing.com/th/id/OIP.AcLhLt0m-3_LRbvI6NXAngHaHa?rs=1&pid=ImgDetMain',
            userName: "Sophia Patel",
            email: "sophiapatel@gmail.com",
            deliveryAddress: "123 Main St Apartment 4A, New York, NY",
            onPaymentTap: () {
              // Payment details action
            },
            onOrderHistoryTap: () {
              // Order history action
            },
            onEditProfileTap: () {
              // Edit profile action
            },
            onLogoutTap: () {
              // Log out action
            },
          ),
        ],
      ),
    );
  }
}

// Profile Header Widget
class ProfileHeader extends StatelessWidget {
  final VoidCallback onBackTap;
  final VoidCallback onSettingsTap;

  const ProfileHeader({
    super.key,
    required this.onBackTap,
    required this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          color: primaryColor.withOpacity(0.9),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: onBackTap,
              ),
              IconButton(
                icon: const Icon(Icons.settings_outlined, color: Colors.white),
                onPressed: onSettingsTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Profile Body Widget
class ProfileBody extends StatelessWidget {
  final String profileImageUrl;
  final String userName;
  final String email;
  final String deliveryAddress;
  final VoidCallback onPaymentTap;
  final VoidCallback onOrderHistoryTap;
  final VoidCallback onEditProfileTap;
  final VoidCallback onLogoutTap;

  const ProfileBody({
    super.key,
    required this.profileImageUrl,
    required this.userName,
    required this.email,
    required this.deliveryAddress,
    required this.onPaymentTap,
    required this.onOrderHistoryTap,
    required this.onEditProfileTap,
    required this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 170),
          padding: const EdgeInsets.only(top: 50),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              ProfileInfoField(label: "Name", value: userName),
              const SizedBox(height: 10),
              ProfileInfoField(label: "Email", value: email),
              const SizedBox(height: 10),
              ProfileInfoField(
                  label: "Delivery Address", value: deliveryAddress),
              const SizedBox(height: 10),
              const ProfileInfoField(
                  label: "Password", value: "●●●●●●●●", icon: Icons.lock),
              const Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("Payment Details",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: onPaymentTap,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("Order History",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: onOrderHistoryTap,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: onEditProfileTap,
                      icon: const Icon(Icons.edit, color: Colors.white),
                      label: const Text("Edit Profile",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: onLogoutTap,
                      icon: const Icon(Icons.logout, color: Colors.red),
                      label: const Text("Log out",
                          style: TextStyle(fontSize: 16, color: Colors.red)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
              .animate()
              .fadeIn(duration: 300.ms, delay: const Duration(seconds: 1))
              .slideX(begin: 0.2, end: 0),
        ),
        Positioned(
          top: 100,
          left: MediaQuery.of(context).size.width * .3,
          right: MediaQuery.of(context).size.width * .3,
          child: ProfilePicture(profileImageUrl: profileImageUrl),
        ),
      ],
    );
  }
}
