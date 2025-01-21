import 'package:flutter/material.dart';

class UserDetailsPageCompactLayout extends StatelessWidget {
  const UserDetailsPageCompactLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UserDetails',
        ),
      ),
      body: Text('test')
    );
  }
}
