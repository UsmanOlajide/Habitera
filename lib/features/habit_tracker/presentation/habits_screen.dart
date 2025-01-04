import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitera/constants/enums.dart';
import 'package:habitera/features/habit_tracker/presentation/widgets/date_section.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  late String currentGreeting;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    currentGreeting = Greeting.currentGreeting; 

    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      // print(DateFormat('HH:mm:ss').format(DateTime.now()));
      final newGreeting = Greeting.currentGreeting;
      if (newGreeting != currentGreeting) {
        setState(() {
          currentGreeting = newGreeting;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentGreeting,
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  const SizedBox(height: 20.0),
                  DateSection()
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                'TODAY',
                style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w700, fontSize: 15.0),
              ),
              Container(
                color: Colors.green,
                height: 400.0,
              ),
              ElevatedButton(
                onPressed: () {
                  // final time = DateFormat.Hm(DateTime.now().hour);
                  print(DateTime.now());
                },
                child: const Text('press'),
              )
            ],
          ),
        ),
      ),
    );
  }
}



















//* OLD getter for current greeting

  // String get greeting {
  //   final hour = DateTime.now().hour;

  //   if (hour >= 0 && hour < 12) {
  //     return 'Good Morning';
  //   } else if (hour >= 12 && hour < 18) {
  //     return 'Good Afternoon';
  //   } else {
  //     return 'Good Evening';
  //   }
  // }
