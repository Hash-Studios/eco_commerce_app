import 'package:eco_commerce_app/core/model/user.dart';
import 'package:flutter/material.dart';
import 'package:eco_commerce_app/globals.dart' as globals;

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  CurrentUser currentUser;
  bool isLoaded;
  void getValue() async {
    currentUser = await globals.currentUser.getUserfromSP();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    isLoaded = false;
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feed')),
      body: Container(
        child: isLoaded
            ? Text(
                '${currentUser.jwt}\n${currentUser.email}\n${currentUser.username}\n${currentUser.id}\n${currentUser.createdAt}')
            : CircularProgressIndicator(),
      ),
    );
  }
}
