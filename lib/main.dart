import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  //Brnch_ilkDemo : 17.01.2025 22:47
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Borsa Cep',
      debugShowCheckedModeBanner: false, // Debug Yazısını Kaldırır.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mini Borsa Cep '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        drawer: Sizer(
          builder: (context, orientation, deviceType) {
            return const AnaMenuCanli();
          },
        ), // Menü
        extendBody: true,

        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Hüseyin ÖZÇAKIR - ozcakirh@hotmail.com"),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class AnaMenu extends StatelessWidget {
  const AnaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            width: 10.w,
            height: 16.h,
            child: DrawerHeader(
              //             EdgeInsetsGeometry? margin = const EdgeInsets.only(bottom: 8.0),
              // EdgeInsetsGeometry padding = const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              // Duration duration = const Duration(milliseconds: 250),
              margin: const EdgeInsets.only(bottom: 8.0),
              //padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              //padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 20.0),
              duration: const Duration(milliseconds: 250),
              decoration: const BoxDecoration(
                color: Colors.deepPurple, // Colors.blue,
                shape: BoxShape.rectangle,
              ),
              child: Text(
                'İşlemler',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.sp, color: Colors.white),
              ),
            ),
          ),
          ListTile(
            hoverColor: Colors.amber,
            focusColor: Colors.red,
            textColor: Colors.blue,
            selectedColor: Colors.red,
            mouseCursor: MouseCursor.defer,
            autofocus: true,
            title: const Text(
              'Komisyon Giriş',
              style: TextStyle(fontSize: 20),
            ),
            //subtitle: const Text('sub Komisyon Giriş'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text(
              'Programdan Çıkış',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}

class AnaMenuCanli extends StatefulWidget {
  const AnaMenuCanli({super.key});

  @override
  State<AnaMenuCanli> createState() => _AnaMenuCanliState();
}

class _AnaMenuCanliState extends State<AnaMenuCanli> {
  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            width: 10.w,
            height: 16.h,
            child: DrawerHeader(
              //             EdgeInsetsGeometry? margin = const EdgeInsets.only(bottom: 8.0),
              // EdgeInsetsGeometry padding = const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              // Duration duration = const Duration(milliseconds: 250),
              margin: const EdgeInsets.only(bottom: 8.0),
              //padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              //padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 20.0),
              duration: const Duration(milliseconds: 250),
              decoration: const BoxDecoration(
                color: Colors.deepPurple, // Colors.blue,
                shape: BoxShape.rectangle,
              ),
              child: Text(
                'İşlemler',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.sp, color: Colors.white),
              ),
            ),
          ),
          ListTile(
            hoverColor: Colors.amber,
            focusColor: Colors.red,
            textColor: Colors.blue,
            selectedColor: Colors.red,
            mouseCursor: MouseCursor.defer,
            autofocus: true,
            title: const Text(
              'Komisyon Giriş',
              style: TextStyle(fontSize: 20),
            ),
            //subtitle: const Text('sub Komisyon Giriş'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text(
              'Programdan Çıkış',
              style: TextStyle(fontSize: 25),
            ),
            onTap: () {
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
