import 'package:flutter/material.dart';
import 'package:air_quality_app/bottomSheet/input.dart';

void main() {
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xff30bdb7),
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;



  @override
  void initState(){
    super.initState();
    _controller=AnimationController(
      vsync: this,
      duration : const Duration(seconds: 2),
      lowerBound: 10,
      upperBound: 500
    );
    _controller.forward();
    _controller.addListener(() {
      setState(() {
      });
    });
  }


  Widget buildBottomSheet(BuildContext context){
    return const Input();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: _controller.value,
                height: _controller.value,
                child: const Image(
                  image: AssetImage('images/Home.jpg'),
                ),
              ),

            ],
          ),
        ),
      ),

      floatingActionButton: _controller.value==500.0? FloatingActionButton(
        onPressed: () {
        showModalBottomSheet(context: context, builder: buildBottomSheet);
        },

        backgroundColor: const Color(0xff93c382),
        child: const Icon(Icons.navigate_next),
      ):null,
    );
  }
}



