import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:music/api/api.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MaterialApp(
    home: MyWidget(),
  ));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  void getData() async {
    print("nfjdn");
    await api.getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("hello"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        child: Icon(Icons.add),
      ),
    );
  }
}
