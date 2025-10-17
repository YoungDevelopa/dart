import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WITH RASHID',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter WITH RASHID'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome Message
              Text(
                'Welcome to the Flutter WITH RASHID!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Interactive Button
              ElevatedButton(
                onPressed: () {
                  print('Button clicked! Hello from Flutter!');
                },
                child: Text('Click Me'),
              ),
              SizedBox(height: 20),

              // Internet Image
              Image.network(
                'https://wallpapers.com/images/featured-full/taekwondo-2ucqu5sad3327aam.jpg',
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
