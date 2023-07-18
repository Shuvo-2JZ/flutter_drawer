import 'package:flutter/material.dart';
import 'package:flutter_app/widget/drawer_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String appTitle = "Drawer";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primaryColor: Colors.red,
        //primarySwatch: Colors.blue,
        textTheme: TextTheme(
          titleMedium: TextStyle(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        dividerColor: Colors.black.withOpacity(0.4),
      ),
      home: MainPage(
        title: appTitle,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
