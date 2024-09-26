import 'dart:async';

import 'package:challenge_2/screens/root_screen.dart';
import 'package:challenge_2/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 100),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {}
      startTimer();
    });
    super.initState();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AnimatedBottomBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                    offset: _animation.value,
                    child: Opacity(
                      opacity: _controller.value,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .33),
                        alignment: Alignment.topCenter,
                        color: primaryColor,
                        child: SvgPicture.asset("assets/foodgo.svg",
                            height: 50,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcATop,
                            )),
                      ),
                    ));
              }),
          Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/splash.png",
              // height: 100,
            ),
          )
        ],
      ),
    );
  }
}
