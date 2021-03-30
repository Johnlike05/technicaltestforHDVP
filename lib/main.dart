import 'package:flutter/material.dart';
import 'package:technicaltestform/src/pages/create_user_page.dart';
import 'package:technicaltestform/src/pages/user_page.dart';
import 'package:technicaltestform/src/pages/users_page.dart';
import 'package:technicaltestform/src/pages/add_address_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
          primaryColor: Colors.indigo,
          secondaryHeaderColor: Colors.deepPurple,
          appBarTheme: AppBarTheme(color: Colors.deepPurple)
        ).copyWith(
            inputDecorationTheme:
                InputDecorationTheme(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)))),
        title: 'Technical test',
        //rutas de uso
        initialRoute: 'users',
        routes: {
          'users'               : (BuildContext context) => UsersPage(),
          'create_user'         : (BuildContext context) => CreateUser(),
          'user'                : (BuildContext context) => UserPage(),
          'address'             : (BuildContext context) => AddAddres(),
        },
    );
    
    
  }
}