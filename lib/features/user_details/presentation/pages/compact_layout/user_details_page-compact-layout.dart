import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_details/features/user_details/presentation/manager/user_details_cubit.dart';

class UserDetailsPageCompactLayout extends StatelessWidget {
   UserDetailsPageCompactLayout({
    super.key,
  });
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UserDetails',
        ),
      ),
      body: Text(''),
    );
  }
}
