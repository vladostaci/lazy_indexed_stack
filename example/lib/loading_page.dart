import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool _loading = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((e) {
      setState(() {
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _loading
          ? Container(
              child: Text(
                "Loading....",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blue,
                ),
              ),
            )
          : Container(
              child: Text(
                "Loaded",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.green,
                ),
              ),
            ),
    );
  }
}
