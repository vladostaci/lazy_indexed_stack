import 'package:flutter/material.dart';

import 'package:lazy_indexed_stack/lazy_indexed_stack.dart';

import 'loading_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'LazyIndexedStack demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LazyIndexedStack(
        reuse: false,
        index: _selectedIndex,
        itemBuilder: (c, i) {
          return LoadingPage();
        },
        itemCount: 4,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.white),
            title: Text("one"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.white),
            title: Text("two"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.white),
            title: Text("three"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.white),
            title: Text("four"),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(() {
            _selectedIndex = i;
          });
        },
      ),
    );
  }
}
