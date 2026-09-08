import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    print("Welcome");
    super.initState();
  }

  // varibale area:
  Color color1 = Colors.pink;
  Color color2 = Colors.blue;
  int number = 0;
  bool isSelected = false;

  // the rebuild starts from here (from build).
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(number.toString(), style: TextStyle(fontSize: 32)),
            SizedBox(height: 120),
            ElevatedButton(
              onPressed: () {
                number++;

                print(number);
                // setstate(), only comes with stateful.
                // it does a rebuild for the app.
                isSelected =! isSelected;
                setState(() {});
              },
              child: Text("Press", style: TextStyle(fontSize: 32)),
            ),
            SizedBox(height: 120),
            Container(
              height: 120,
              width: 120,
              color: isSelected ? color1 : color2,
            ),
          ],
        ),
      ),
    );
  }
}
