import 'package:crudapp_personal_project/product_list_screen.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud App',
      theme: _lightThemeData(),
      darkTheme: _darkThemeData(),
      themeMode: ThemeMode.dark,
      home: ProductListScreen(),
    );
  }

  ThemeData _lightThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(double.maxFinite),
        //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      )),
    );
  }

  ThemeData _darkThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(double.maxFinite),
        //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      )),
    );
  }
}
