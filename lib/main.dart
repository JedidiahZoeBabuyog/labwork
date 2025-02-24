import 'package:flutter/material.dart';
import 'package:monday_labwork/provider/item_provider.dart';
import 'package:monday_labwork/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AssignmentApp());
}

class AssignmentApp extends StatelessWidget {
  const AssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Products())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
