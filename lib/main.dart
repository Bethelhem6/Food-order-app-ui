// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state, avoid_print

import 'package:challenge_2/screens/splash.dart';
import 'package:challenge_2/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Splash(),
      theme: ThemeData(
          primaryColor: primaryColor,
          primarySwatch: Colors.green,
          useMaterial3: false,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LifecycleDemo extends StatefulWidget {
  const LifecycleDemo({super.key});

  @override
  _LifecycleDemoState createState() {
    print('createState() called');
    return _LifecycleDemoState();
  }
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  @override
  void initState() {
    super.initState();
    print('initState() called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies() called');
  }

  @override
  Widget build(BuildContext context) {
    print('build() called');
    return Center(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            print('setState() called');
          });
        },
        child: const Text('Press me'),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant LifecycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget() called');
  }

  @override
  void dispose() {
    print('dispose() called');
    super.dispose();
  }
}
