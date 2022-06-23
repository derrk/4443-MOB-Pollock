import 'package:flutter/material.dart';
import 'package:taco_tracker/screens/welcome_screen.dart';
import 'package:taco_tracker/screens/login_screen.dart';
import 'package:taco_tracker/screens/registration_screen.dart';
import 'package:taco_tracker/screens/food_trucks.dart';

void main() => runApp(TacoTracker());

class TacoTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        FoodTruckScreen.id: (context) => FoodTruckScreen(),
      },
    );
  }
}
