// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state, avoid_print

import 'package:challenge_2/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
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
