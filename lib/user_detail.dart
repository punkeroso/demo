import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  final String uid;

  UserDetail(this.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User detail'),
      ),
      body: Text(uid),
    );
  }
}